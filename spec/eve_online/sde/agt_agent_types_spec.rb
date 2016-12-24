require 'spec_helper'

describe EveOnline::SDE::AgtAgentTypes do
  let(:file) { double }

  subject { described_class.new(file) }

  specify { expect(subject).to be_a(EveOnline::SDE::Base) }

  describe '#agt_agent_types' do
    let(:item) { double }

    let(:agt_agent_type) { double }

    before { expect(subject).to receive(:data).and_return([item]) }

    before do
      #
      # EveOnline::SDE::Models::AgtAgentType.new(item) => agt_agent_type
      #
      expect(EveOnline::SDE::Models::AgtAgentType).to receive(:new).with(item).and_return(agt_agent_type)
    end

    specify { expect(subject.agt_agent_types).to eq([agt_agent_type]) }

    specify { expect { subject.agt_agent_types }.to change { subject.instance_variable_defined?(:@_memoized_agt_agent_types) }.from(false).to(true) }
  end
end
