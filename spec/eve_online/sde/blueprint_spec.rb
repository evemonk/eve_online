require 'spec_helper'

describe EveOnline::SDE::Blueprint do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:blueprint) { described_class.new(options) }

    before { expect(blueprint).to receive(:blueprint_type_id).and_return(681) }

    before { expect(blueprint).to receive(:max_production_limit).and_return(300) }

    subject { blueprint.as_json }

    its([:blueprint_type_id]) { should eq(681) }

    its([:max_production_limit]) { should eq(300) }
  end

  describe '#blueprint_type_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('blueprintTypeID')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('blueprintTypeID')
        end
      end
    end

    specify { expect { subject.blueprint_type_id }.not_to raise_error }
  end

  describe '#max_production_limit' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('maxProductionLimit')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('maxProductionLimit')
        end
      end
    end

    specify { expect { subject.max_production_limit }.not_to raise_error }
  end
end
