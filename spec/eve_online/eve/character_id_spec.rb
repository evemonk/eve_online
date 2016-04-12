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

  # describe '#names_list' do
  #   context 'names is string' do
  #     let(:names) { 'Ito Saika' }
  #
  #     specify { expect(subject.names_list).to eq('Ito Saika') }
  #   end
  #
  #   context 'names is array' do
  #     let(:names) { ['Ito Saika', 'Shion Saika'] }
  #
  #     specify { expect(subject.names_list).to eq('Ito Saika,Shion Saika') }
  #   end
  #
  #   context 'names '
  # end
  #
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
