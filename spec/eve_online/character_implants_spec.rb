require 'spec_helper'

describe EveOnline::CharacterImplants do
  describe '#initialize' do
    let(:result) { double }

    subject { described_class.new(result) }

    its(:result) { should eq(result) }
  end
end
