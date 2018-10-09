# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Models::Planets do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#planets' do
    let(:planet) { instance_double(EveOnline::ESI::Models::Planet) }

    let(:option) { double }

    let(:options) { [option] }

    before { expect(EveOnline::ESI::Models::Planet).to receive(:new).with(option).and_return(planet) }

    before { expect(subject.planets).to eq([planet]) }
  end
end
