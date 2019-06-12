# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Models::LoyaltyStoreOffer do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:loyalty_store_offer) { described_class.new(options) }

    let(:ak_cost) { double }

    before { expect(loyalty_store_offer).to receive(:ak_cost).and_return(ak_cost) }

    before { expect(loyalty_store_offer).to receive(:isk_cost).and_return(2_400_000) }

    before { expect(loyalty_store_offer).to receive(:lp_cost).and_return(2_400) }

    before { expect(loyalty_store_offer).to receive(:offer_id).and_return(3_584) }

    before { expect(loyalty_store_offer).to receive(:quantity).and_return(5_000) }

    before { expect(loyalty_store_offer).to receive(:type_id).and_return(23_047) }

    subject { loyalty_store_offer.as_json }

    its([:ak_cost]) { should eq(ak_cost) }

    its([:isk_cost]) { should eq(2_400_000) }

    its([:lp_cost]) { should eq(2_400) }

    its([:offer_id]) { should eq(3_584) }

    its([:quantity]) { should eq(5_000) }

    its([:type_id]) { should eq(23_047) }
  end

  describe '#ak_cost' do
    before { expect(options).to receive(:[]).with('ak_cost') }

    specify { expect { subject.ak_cost }.not_to raise_error }
  end

  describe '#isk_cost' do
    before { expect(options).to receive(:[]).with('isk_cost') }

    specify { expect { subject.isk_cost }.not_to raise_error }
  end

  describe '#lp_cost' do
    before { expect(options).to receive(:[]).with('lp_cost') }

    specify { expect { subject.lp_cost }.not_to raise_error }
  end

  describe '#offer_id' do
    before { expect(options).to receive(:[]).with('offer_id') }

    specify { expect { subject.offer_id }.not_to raise_error }
  end

  describe '#quantity' do
    before { expect(options).to receive(:[]).with('quantity') }

    specify { expect { subject.quantity }.not_to raise_error }
  end

  describe '#type_id' do
    before { expect(options).to receive(:[]).with('type_id') }

    specify { expect { subject.type_id }.not_to raise_error }
  end
end
