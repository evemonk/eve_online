require 'spec_helper'

describe EveOnline::SDE::Models::AgtAgentType do
  describe '#initialize' do
    let(:data) { double }

    subject { described_class.new(data) }

    its(:data) { should eq(data) }
  end

  describe '#as_json' do
    let(:data) { double }

    let(:agt_agent_type) { described_class.new(data) }

    let(:agent_type) { double }

    let(:agent_type_id) { double }

    before { expect(agt_agent_type).to receive(:agent_type).and_return(agent_type) }

    before { expect(agt_agent_type).to receive(:agent_type_id).and_return(agent_type_id) }

    subject { agt_agent_type.as_json }

    its([:agent_type]) { should eq(agent_type) }

    its([:agent_type_id]) { should eq(agent_type_id) }
  end

  describe '#agent_type' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['agentType']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('agentType')
        end
      end
    end

    specify { expect { subject.agent_type }.not_to raise_error }
  end

  describe '#agent_type_id' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['agentTypeID']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('agentTypeID')
        end
      end
    end

    specify { expect { subject.agent_type_id }.not_to raise_error }
  end
end
