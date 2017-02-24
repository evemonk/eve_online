require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::ESI::CharacterSkillQueue do
  let(:token) { 'token123' }

  let(:character_id) { 12_345_678 }

  subject { described_class.new(token, character_id) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/latest/characters/%s/skillqueue/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq(token) }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(character_id) }
  end

  describe '#skills' do
    let(:skill_queue_entry) { double }

    let(:response) do
      [
        {
          'skill_id' => 12_487,
          'finished_level' => 3,
          'queue_position' => 0,
          'finish_date' => '2017-01-16T03:00:35Z',
          'start_date' => '2017-01-15T11:38:25Z',
          'training_start_sp' => 7_263,
          'level_end_sp' => 40_000,
          'level_start_sp' => 7_072
        }
      ]
    end

    before do
      #
      # subject.response # => [{"skill_id"=>12487, "finished_level"=>3, "queue_position"=>0, "finish_date"=>"2017-01-16T03:00:35Z", "start_date"=>"2017-01-15T11:38:25Z", "training_start_sp"=>7263, "level_end_sp"=>40000, "level_start_sp"=>7072}]
      #
      expect(subject).to receive(:response).and_return(response)
    end

    before do
      #
      # EveOnline::ESI::Models::SkillQueueEntry.new(response.first) # => skill_queue_entry
      #
      expect(EveOnline::ESI::Models::SkillQueueEntry).to receive(:new).with(response.first).and_return(skill_queue_entry)
    end

    specify { expect(subject.skills).to eq([skill_queue_entry]) }

    specify { expect { subject.skills }.to change { subject.instance_variable_defined?(:@_memoized_skills) }.from(false).to(true) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-skills.read_skillqueue.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq(described_class::API_ENDPOINT % character_id)
    end
  end
end
