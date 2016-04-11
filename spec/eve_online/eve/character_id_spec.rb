require 'spec_helper'

describe EveOnline::Eve::CharacterID do
  let(:names) { double }

  subject { described_class.new(names) }

  specify { expect(subject).to be_a EveOnline::Base }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/eve/CharacterID.xml.aspx') }

  describe '#initialize' do
    its(:names) { should eq(names) }
  end

  describe '#characters' do
    specify { expect { subject.characters }.to raise_error(NotImplementedError) }
  end

  describe '#names_list' do
    context 'invalid names' do
      let(:names) { 'not-an-array' }

      specify { expect { subject.names_list }.to raise_error(RuntimeError) }
    end

    context 'valid names' do
      let(:names) { ['Ito Saika', 'Shion Saika'] }

      specify { expect(subject.names_list).to eq('Ito Saika,Shion Saika') }
    end
  end

  describe '#escaped_names_list' do
    let(:names_list) { double }

    before { expect(subject).to receive(:names_list).and_return(names_list) }

    before do
      #
      # URI.escape(names_list)
      #
      expect(URI).to receive(:escape).with(names_list)
    end

    specify { expect { subject.escaped_names_list }.not_to raise_error }
  end

  describe '#url' do
    let(:escaped_names_list) { 'string' }

    before { expect(subject).to receive(:escaped_names_list).and_return(escaped_names_list) }

    specify { expect(subject.url).to eq('https://api.eveonline.com/eve/CharacterID.xml.aspx?names=string') }
  end
end
