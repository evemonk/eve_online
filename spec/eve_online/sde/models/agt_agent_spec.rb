# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::SDE::Models::AgtAgent do
  describe '#initialize' do
    let(:data) { double }

    subject { described_class.new(data) }

    its(:data) { should eq(data) }
  end

  describe '#as_json' do
    let(:data) { double }

    let(:agt_agent) { described_class.new(data) }

    let(:agent_id) { double }

    let(:agent_type_id) { double }

    let(:corporation_id) { double }

    let(:division_id) { double }

    let(:is_locator) { double }

    let(:level) { double }

    let(:location_id) { double }

    let(:quality) { double }

    before { expect(agt_agent).to receive(:agent_id).and_return(agent_id) }

    before { expect(agt_agent).to receive(:agent_type_id).and_return(agent_type_id) }

    before { expect(agt_agent).to receive(:corporation_id).and_return(corporation_id) }

    before { expect(agt_agent).to receive(:division_id).and_return(division_id) }

    before { expect(agt_agent).to receive(:is_locator).and_return(is_locator) }

    before { expect(agt_agent).to receive(:level).and_return(level) }

    before { expect(agt_agent).to receive(:location_id).and_return(location_id) }

    before { expect(agt_agent).to receive(:quality).and_return(quality) }

    subject { agt_agent.as_json }

    its([:agent_id]) { should eq(agent_id) }

    its([:agent_type_id]) { should eq(agent_type_id) }

    its([:corporation_id]) { should eq(corporation_id) }

    its([:division_id]) { should eq(division_id) }

    its([:is_locator]) { should eq(is_locator) }

    its([:level]) { should eq(level) }

    its([:location_id]) { should eq(location_id) }

    its([:quality]) { should eq(quality) }
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

  describe '#corporation_id' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['corporationID']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('corporationID')
        end
      end
    end

    specify { expect { subject.corporation_id }.not_to raise_error }
  end

  describe '#division_id' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['divisionID']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('divisionID')
        end
      end
    end

    specify { expect { subject.division_id }.not_to raise_error }
  end

  describe '#is_locator' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['isLocator']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('isLocator')
        end
      end
    end

    specify { expect { subject.is_locator }.not_to raise_error }
  end

  describe '#level' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['level']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('level')
        end
      end
    end

    specify { expect { subject.level }.not_to raise_error }
  end

  describe '#location_id' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['locationID']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('locationID')
        end
      end
    end

    specify { expect { subject.location_id }.not_to raise_error }
  end

  describe '#quality' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['quality']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('quality')
        end
      end
    end

    specify { expect { subject.quality }.not_to raise_error }
  end
end
