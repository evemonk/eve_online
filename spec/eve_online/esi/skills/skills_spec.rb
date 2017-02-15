require 'spec_helper'

describe EveOnline::ESI::Skills::Skills do
  let(:token) { 'token123' }

  let(:character_id) { 12_345_678 }

  subject { described_class.new(token, character_id) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/latest/characters/%s/skills/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq(token) }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(character_id) }
  end

  describe '#as_json' do
    let(:skills) { described_class.new(token, character_id) }

    let(:total_sp) { double }

    let(:skills_array) { double }

    before { expect(skills).to receive(:total_sp).and_return(total_sp) }

    before { expect(skills).to receive(:skills).and_return(skills_array) }

    subject { skills.as_json }

    its([:total_sp]) { should eq(total_sp) }

    its([:skills]) { should eq(skills_array) }
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
    before do
      #
      # subject.response.fetch('skills')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('skills')
        end
      end
    end

    specify { expect { subject.skills }.not_to raise_error }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-skills.read_skills.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq(described_class::API_ENDPOINT % character_id)
    end
  end
end
