# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::CorporationOrder do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:corporation_order) { described_class.new(options) }

    let(:issued) { double }

    let(:issued_by) { double }

    before { expect(corporation_order).to receive(:duration).and_return(30) }

    before { expect(corporation_order).to receive(:escrow).and_return(45.6) }

    before { expect(corporation_order).to receive(:is_buy_order).and_return(true) }

    before { expect(corporation_order).to receive(:issued).and_return(issued) }

    before { expect(corporation_order).to receive(:issued_by).and_return(issued_by) }

    before { expect(corporation_order).to receive(:location_id).and_return(456) }

    before { expect(corporation_order).to receive(:min_volume).and_return(1) }

    before { expect(corporation_order).to receive(:order_id).and_return(123) }

    before { expect(corporation_order).to receive(:price).and_return(33.3) }

    before { expect(corporation_order).to receive(:range).and_return("station") }

    before { expect(corporation_order).to receive(:region_id).and_return(123) }

    before { expect(corporation_order).to receive(:type_id).and_return(456) }

    before { expect(corporation_order).to receive(:volume_remain).and_return(4422) }

    before { expect(corporation_order).to receive(:volume_total).and_return(123_456) }

    before { expect(corporation_order).to receive(:wallet_division).and_return(1) }

    subject { corporation_order.as_json }

    its([:duration]) { should eq(30) }

    its([:escrow]) { should eq(45.6) }

    its([:is_buy_order]) { should eq(true) }

    its([:issued]) { should eq(issued) }

    its([:issued_by]) { should eq(issued_by) }

    its([:location_id]) { should eq(456) }

    its([:min_volume]) { should eq(1) }

    its([:order_id]) { should eq(123) }

    its([:price]) { should eq(33.3) }

    its([:range]) { should eq("station") }

    its([:region_id]) { should eq(123) }

    its([:type_id]) { should eq(456) }

    its([:volume_remain]) { should eq(4422) }

    its([:volume_total]) { should eq(123_456) }

    its([:wallet_division]) { should eq(1) }
  end

  describe "#duration" do
    before { expect(options).to receive(:[]).with("duration") }

    specify { expect { subject.duration }.not_to raise_error }
  end

  describe "#escrow" do
    before { expect(options).to receive(:[]).with("escrow") }

    specify { expect { subject.escrow }.not_to raise_error }
  end

  describe "#is_buy_order" do
    before { expect(options).to receive(:[]).with("is_buy_order") }

    specify { expect { subject.is_buy_order }.not_to raise_error }
  end

  describe "#issued" do
    context "when issued is present" do
      let(:issued) { double }

      before { expect(options).to receive(:[]).with("issued").and_return(issued) }

      before do
        #
        # subject.parse_datetime_with_timezone(issued)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(issued)
      end

      specify { expect { subject.issued }.not_to raise_error }
    end

    context "when issued not present" do
      before { expect(options).to receive(:[]).with("issued").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.issued }.not_to raise_error }
    end
  end

  describe "#issued_by" do
    before { expect(options).to receive(:[]).with("issued_by") }

    specify { expect { subject.issued_by }.not_to raise_error }
  end

  describe "#location_id" do
    before { expect(options).to receive(:[]).with("location_id") }

    specify { expect { subject.location_id }.not_to raise_error }
  end

  describe "#min_volume" do
    before { expect(options).to receive(:[]).with("min_volume") }

    specify { expect { subject.min_volume }.not_to raise_error }
  end

  describe "#order_id" do
    before { expect(options).to receive(:[]).with("order_id") }

    specify { expect { subject.order_id }.not_to raise_error }
  end

  describe "#price" do
    before { expect(options).to receive(:[]).with("price") }

    specify { expect { subject.price }.not_to raise_error }
  end

  describe "#range" do
    before { expect(options).to receive(:[]).with("range") }

    specify { expect { subject.range }.not_to raise_error }
  end

  describe "#region_id" do
    before { expect(options).to receive(:[]).with("region_id") }

    specify { expect { subject.region_id }.not_to raise_error }
  end

  describe "#type_id" do
    before { expect(options).to receive(:[]).with("type_id") }

    specify { expect { subject.type_id }.not_to raise_error }
  end

  describe "#volume_remain" do
    before { expect(options).to receive(:[]).with("volume_remain") }

    specify { expect { subject.volume_remain }.not_to raise_error }
  end

  describe "#volume_total" do
    before { expect(options).to receive(:[]).with("volume_total") }

    specify { expect { subject.volume_total }.not_to raise_error }
  end

  describe "#wallet_division" do
    before { expect(options).to receive(:[]).with("wallet_division") }

    specify { expect { subject.wallet_division }.not_to raise_error }
  end
end
