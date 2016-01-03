require 'spec_helper'

describe EveOnline::EventResponseObject do
  describe '#initialize' do
    let(:input) { 'test' }
    
    subject { described_class.new(input) }
    
    its(:input) { should eq(input) }
  end

  describe 'value' do
    context 'Undecided' do
      subject { described_class.new('Undecided') }
      
      its(:value) { should eq(:undecided) }
    end
    
    context 'Accepted' do
      subject { described_class.new('Accepted') }

      its(:value) { should eq(:accepted) }
    end

    context 'Declined' do
      subject { described_class.new('Declined') }
      
      its(:value) { should eq(:declined) }
    end
    
    context 'Tentative' do
      subject { described_class.new('Tentative') }
      
      its(:value) { should eq(:tentative) }
    end
    
    context 'invalid input' do
      subject { described_class.new('invalid input') }
      
      specify { expect { subject.value }.to raise_error(ArgumentError) }
    end
  end
end
