require 'spec_helper'

describe EveOnline::Eve::CharacterID do
  let(:names) { double }

  subject { described_class.new(names) }

  specify { expect(subject).to be_a EveOnline::Base }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/eve/CharacterID.xml.aspx') }

  describe '#initialize' do
    its(:names) { should eq(names) }
  end
end
