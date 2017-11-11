require 'spec_helper'

describe EveOnline::ESI::CharacterSkills do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v3/characters/%s/skills/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq('token123') }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe '#as_json' do
    let(:skills) { described_class.new(options) }

    let(:total_sp) { double }

    before { expect(skills).to receive(:total_sp).and_return(total_sp) }

    subject { skills.as_json }

    its([:total_sp]) { should eq(total_sp) }
  end

  describe '#total_sp' do
    before do
      #
      # subject.response.fetch('total_sp')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('total_sp')
        end
      end
    end

    specify { expect { subject.total_sp }.not_to raise_error }
  end

  describe '#skills' do
    let(:skill) { double }

    let(:response) do
      [
        {
          'skill_id' => 22_536,
          'skillpoints_in_skill' => 500,
          'current_skill_level' => 1
        }
      ]
    end

    before do
      #
      # subject.response.fetch('skills') # => [{"skill_id"=>22536, "skillpoints_in_skill"=>500, "current_skill_level"=>1}]
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('skills').and_return(response)
        end
      end
    end

    before do
      #
      # EveOnline::ESI::Models::Skill.new(response.first) # => skill
      #
      expect(EveOnline::ESI::Models::Skill).to receive(:new).with(response.first).and_return(skill)
    end

    specify { expect(subject.skills).to eq([skill]) }

    specify { expect { subject.skills }.to change { subject.instance_variable_defined?(:@_memoized_skills) }.from(false).to(true) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-skills.read_skills.v1') }
  end

  describe '#url' do
    specify { expect(subject.url).to eq('https://esi.tech.ccp.is/v3/characters/12345678/skills/?datasource=tranquility') }
  end
end
