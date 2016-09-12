require 'spec_helper'

describe EveOnline::AccountTypeObject do
  describe '#initialize' do
    let(:input) { double }

    subject { described_class.new(input) }

    its(:input) { should eq(input) }
  end

  describe 'value' do
    context 'Undecided' do
      subject { described_class.new('Character') }

      its(:value) { should eq(:character) }
    end

    context 'Accepted' do
      subject { described_class.new('Account') }

      its(:value) { should eq(:account) }
    end

    context 'invalid input' do
      subject { described_class.new('invalid input') }

      specify { expect { subject.value }.to raise_error(ArgumentError) }
    end
  end
end
