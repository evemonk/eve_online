require 'spec_helper'

describe EveOnline::Eve::CharacterID do
  let(:input) { double }

  subject { described_class.new(input) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/eve/CharacterID.xml.aspx') }

  specify { expect(subject).to be_a(EveOnline::BaseXML) }

  describe '#initialize' do
    let(:parser) { double }

    before do
      #
      # Nori.new(advanced_typecasting: false) => double
      #
      expect(Nori).to receive(:new).with(advanced_typecasting: false).and_return(parser)
    end

    its(:parser) { should eq(parser) }

    its(:input) { should eq(input) }
  end

  describe '#characters' do
    specify { expect { subject.characters }.to raise_error(NotImplementedError) }
  end

  describe '#names' do
    context 'input is String' do
      let(:input) { 'Ito Saika' }

      specify { expect(subject.names).to eq('Ito Saika') }
    end

    context 'input is Array' do
      let(:input) { ['Ito Saika', 'Shion Saika'] }

      specify { expect(subject.names).to eq('Ito Saika,Shion Saika') }
    end

    context 'input is invalid' do
      let(:input) { {} }

      specify { expect { subject.names }.to raise_error(ArgumentError) }
    end
  end

  describe '#escaped_input' do
    let(:names) { double }

    before { expect(subject).to receive(:names).and_return(names) }

    before do
      #
      # URI.escape(names)
      #
      expect(URI).to receive(:escape).with(names)
    end

    specify { expect { subject.escaped_input }.not_to raise_error }
  end

  describe '#url' do
    let(:escaped_input) { 'string' }

    before { expect(subject).to receive(:escaped_input).and_return(escaped_input) }

    specify { expect(subject.url).to eq('https://api.eveonline.com/eve/CharacterID.xml.aspx?names=string') }
  end
end
