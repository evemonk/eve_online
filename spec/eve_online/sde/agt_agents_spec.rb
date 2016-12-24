require 'spec_helper'

describe EveOnline::SDE::AgtAgents do
  let(:file) { double }

  subject { described_class.new(file) }

  specify { expect(subject).to be_a(EveOnline::SDE::Base) }

  describe '#agt_agents' do
    let(:item) { double }

    let(:agt_agent) { double }

    before { expect(subject).to receive(:data).and_return([item]) }

    before do
      #
      # EveOnline::SDE::Models::AgtAgent.new(item) => agt_agent
      #
      expect(EveOnline::SDE::Models::AgtAgent).to receive(:new).with(item).and_return(agt_agent)
    end

    specify { expect(subject.agt_agents).to eq([agt_agent]) }

    specify { expect { subject.agt_agents }.to change { subject.instance_variable_defined?(:@_memoized_agt_agents) }.from(false).to(true) }
  end
end
