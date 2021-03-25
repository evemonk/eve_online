# frozen_string_literal: true

require "spec_helper"

describe EveOnline::Formulas::TrainingRate do
  describe "#rate" do
    # e.g. Memory: 24
    let(:primary) { 24 }

    # e.g. Charisma: 20
    let(:secondary) { 20 }

    subject { described_class.new(primary, secondary) }

    specify { expect(subject.rate).to eq(34.0) }
  end
end
