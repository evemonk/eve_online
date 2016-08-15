require 'spec_helper'

describe EveOnline::Implant do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end
end
