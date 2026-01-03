# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Constellation do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:constellation) { described_class.new(options) }

    before { expect(constellation).to receive(:constellation_id).and_return(20_000_001) }

    before { expect(constellation).to receive(:name).and_return("San Matar") }

    before { expect(constellation).to receive(:region_id).and_return(10_000_001) }

    subject { constellation.as_json }

    its([:constellation_id]) { should eq(20_000_001) }

    its([:name]) { should eq("San Matar") }

    its([:region_id]) { should eq(10_000_001) }
  end

  describe "#constellation_id" do
    before { expect(options).to receive(:[]).with("constellation_id") }

    specify { expect { subject.constellation_id }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#region_id" do
    before { expect(options).to receive(:[]).with("region_id") }

    specify { expect { subject.region_id }.not_to raise_error }
  end

  describe "#system_ids" do
    before { expect(options).to receive(:[]).with("systems") }

    specify { expect { subject.system_ids }.not_to raise_error }
  end

  describe "#position" do
    context "when @position set" do
      let(:position) { double }

      before { subject.instance_variable_set(:@position, position) }

      specify { expect(subject.position).to eq(position) }
    end

    context "when @position not set" do
      let(:position) { double }

      let(:option) { double }

      before do
        #
        # subject.options['position'] => option
        #
        expect(subject).to receive(:options) do
          double.tap do |a|
            expect(a).to receive(:[]).with("position").and_return(option)
          end
        end
      end

      before { expect(EveOnline::ESI::Models::Position).to receive(:new).with(option).and_return(position) }

      specify { expect { subject.position }.not_to raise_error }

      specify { expect { subject.position }.to change { subject.instance_variable_get(:@position) }.from(nil).to(position) }
    end
  end
end
