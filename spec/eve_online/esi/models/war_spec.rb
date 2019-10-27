# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Models::War do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:war) { described_class.new(options) }

    let(:declared) { double }

    let(:finished) { double }

    let(:retracted) { double }

    let(:started) { double }

    before { expect(war).to receive(:declared).and_return(declared) }

    before { expect(war).to receive(:finished).and_return(finished) }

    before { expect(war).to receive(:war_id).and_return(615_578) }

    before { expect(war).to receive(:mutual).and_return(false) }

    before { expect(war).to receive(:open_for_allies).and_return(false) }

    before { expect(war).to receive(:retracted).and_return(retracted) }

    before { expect(war).to receive(:started).and_return(started) }

    subject { war.as_json }

    its([:declared]) { should eq(declared) }

    its([:finished]) { should eq(finished) }

    its([:war_id]) { should eq(615_578) }

    its([:mutual]) { should eq(false) }

    its([:open_for_allies]) { should eq(false) }

    its([:retracted]) { should eq(retracted) }

    its([:started]) { should eq(started) }
  end
end
