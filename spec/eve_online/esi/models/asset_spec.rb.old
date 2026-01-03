# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Asset do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:asset) { described_class.new(options) }

    before { expect(asset).to receive(:is_blueprint_copy).and_return(true) }

    before { expect(asset).to receive(:is_singleton).and_return(true) }

    before { expect(asset).to receive(:item_id).and_return(716_338_097) }

    before { expect(asset).to receive(:location_flag).and_return("Hangar") }

    before { expect(asset).to receive(:location_id).and_return(1_027_847_409_779) }

    before { expect(asset).to receive(:location_type).and_return("other") }

    before { expect(asset).to receive(:quantity).and_return(1) }

    before { expect(asset).to receive(:type_id).and_return(1010) }

    subject { asset.as_json }

    its([:is_blueprint_copy]) { should eq(true) }

    its([:is_singleton]) { should eq(true) }

    its([:item_id]) { should eq(716_338_097) }

    its([:location_flag]) { should eq("Hangar") }

    its([:location_id]) { should eq(1_027_847_409_779) }

    its([:location_type]) { should eq("other") }

    its([:quantity]) { should eq(1) }

    its([:type_id]) { should eq(1010) }
  end

  describe "#is_blueprint_copy" do
    before { expect(options).to receive(:[]).with("is_blueprint_copy") }

    specify { expect { subject.is_blueprint_copy }.not_to raise_error }
  end

  describe "#is_singleton" do
    before { expect(options).to receive(:[]).with("is_singleton") }

    specify { expect { subject.is_singleton }.not_to raise_error }
  end

  describe "#item_id" do
    before { expect(options).to receive(:[]).with("item_id") }

    specify { expect { subject.item_id }.not_to raise_error }
  end

  describe "#location_flag" do
    before { expect(options).to receive(:[]).with("location_flag") }

    specify { expect { subject.location_flag }.not_to raise_error }
  end

  describe "#location_id" do
    before { expect(options).to receive(:[]).with("location_id") }

    specify { expect { subject.location_id }.not_to raise_error }
  end

  describe "#location_type" do
    before { expect(options).to receive(:[]).with("location_type") }

    specify { expect { subject.location_type }.not_to raise_error }
  end

  describe "#quantity" do
    before { expect(options).to receive(:[]).with("quantity") }

    specify { expect { subject.quantity }.not_to raise_error }
  end

  describe "#type_id" do
    before { expect(options).to receive(:[]).with("type_id") }

    specify { expect { subject.type_id }.not_to raise_error }
  end
end
