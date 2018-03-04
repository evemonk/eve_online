# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::SDE::AgtResearchAgents do
  let(:file) { double }

  subject { described_class.new(file) }

  specify { expect(subject).to be_a(EveOnline::SDE::Base) }

  describe '#agt_research_agents' do
    let(:item) { double }

    let(:agt_research_agent) { double }

    before { expect(subject).to receive(:data).and_return([item]) }

    before do
      #
      # EveOnline::SDE::Models::AgtResearchAgent.new(item) => agt_research_agent
      #
      expect(EveOnline::SDE::Models::AgtResearchAgent).to receive(:new).with(item).and_return(agt_research_agent)
    end

    specify { expect(subject.agt_research_agents).to eq([agt_research_agent]) }

    specify { expect { subject.agt_research_agents }.to change { subject.instance_variable_defined?(:@_memoized_agt_research_agents) }.from(false).to(true) }
  end
end
