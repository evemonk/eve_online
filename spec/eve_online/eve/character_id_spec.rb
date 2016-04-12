require 'spec_helper'

describe EveOnline::Eve::CharacterID do
  let(:input) { double }

  subject { described_class.new(input) }

  specify { expect(subject).to be_a EveOnline::Base }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/eve/CharacterID.xml.aspx') }

  describe '#initialize' do
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
      let(:input) { Hash.new }

      specify { expect { subject.names }.to raise_error(ArgumentError) }
    end
  end

  # describe '#escaped_names_list' do
  #   let(:names_list) { double }
  #
  #   before { expect(subject).to receive(:names_list).and_return(names_list) }
  #
  #   before do
  #     #
  #     # URI.escape(names_list)
  #     #
  #     expect(URI).to receive(:escape).with(names_list)
  #   end
  #
  #   specify { expect { subject.escaped_names_list }.not_to raise_error }
  # end
  #
  # describe '#url' do
  #   let(:escaped_names_list) { 'string' }
  #
  #   before { expect(subject).to receive(:escaped_names_list).and_return(escaped_names_list) }
  #
  #   specify { expect(subject.url).to eq('https://api.eveonline.com/eve/CharacterID.xml.aspx?names=string') }
  # end
end
