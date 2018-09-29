# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Models::DogmaEffect do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end
end
