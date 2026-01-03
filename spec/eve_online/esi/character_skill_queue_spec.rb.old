# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterSkillQueue do
  let(:options) { {token: "token123", character_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v2/characters/%<character_id>s/skillqueue/") }

  describe "#initialize" do
    its(:token) { should eq("token123") }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe "#skills" do
    context "when @skills set" do
      let(:skills) { [instance_double(EveOnline::ESI::Models::SkillQueueEntry)] }

      before { subject.instance_variable_set(:@skills, skills) }

      specify { expect(subject.skills).to eq(skills) }
    end

    context "when @skills not set" do
      let(:skill_queue_entry) { instance_double(EveOnline::ESI::Models::SkillQueueEntry) }

      let(:response) do
        [
          {
            skill_id: 12_487,
            finished_level: 3,
            queue_position: 0,
            finish_date: "2017-01-16T03:00:35Z",
            start_date: "2017-01-15T11:38:25Z",
            training_start_sp: 7_263,
            level_end_sp: 40_000,
            level_start_sp: 7_072
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

      specify { expect { subject.skills }.to change { subject.instance_variable_get(:@skills) }.from(nil).to([skill_queue_entry]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-skills.read_skillqueue.v1") }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v2/characters/12345678/skillqueue/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v2/characters/12345678/skillqueue/")
    end
  end
end
