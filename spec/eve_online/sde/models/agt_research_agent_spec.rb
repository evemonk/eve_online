# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::SDE::Models::AgtResearchAgent do
  describe '#initialize' do
    let(:data) { double }

    subject { described_class.new(data) }

    its(:data) { should eq(data) }
  end

  describe '#as_json' do
    let(:data) { double }

    let(:agt_research_agent) { described_class.new(data) }

    let(:agent_id) { double }

    let(:type_id) { double }

    before { expect(agt_research_agent).to receive(:agent_id).and_return(agent_id) }

    before { expect(agt_research_agent).to receive(:type_id).and_return(type_id) }

    subject { agt_research_agent.as_json }

    its([:agent_id]) { should eq(agent_id) }

    its([:type_id]) { should eq(type_id) }
  end

  describe '#agent_id' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['agentID']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('agentID')
        end
      end
    end

    specify { expect { subject.agent_id }.not_to raise_error }
  end

  describe '#type_id' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['typeID']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('typeID')
        end
      end
    end

    specify { expect { subject.type_id }.not_to raise_error }
  end
end
