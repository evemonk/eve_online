require 'spec_helper'

describe EveOnline::AccountTypeObject do
  describe '#initialize' do
    let(:input) { double }

    subject { described_class.new(input) }

    its(:input) { should eq(input) }
  end

  describe 'value' do
    context 'Character' do
      subject { described_class.new('Character') }

      its(:value) { should eq(:character) }
    end

    context 'Account' do
      subject { described_class.new('Account') }

      its(:value) { should eq(:account) }
    end

    context 'Corporation' do
      subject { described_class.new('Corporation') }

      its(:value) { should eq(:corporation) }
    end

    context 'invalid input' do
      subject { described_class.new('invalid input') }

      specify { expect { subject.value }.to raise_error(ArgumentError) }
    end
  end
end
