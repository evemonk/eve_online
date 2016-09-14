require 'spec_helper'

describe EveOnline::SDE::Blueprints do
  describe '#initialize' do
    let(:file) { double }

    subject { described_class.new(file) }

    its(:file) { should eq(file) }
  end
end
