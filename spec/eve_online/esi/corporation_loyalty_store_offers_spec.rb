# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CorporationLoyaltyStoreOffers do
  let(:options) { {corporation_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/loyalty/stores/%<corporation_id>s/offers/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:corporation_id) { should eq(12_345_678) }
  end

  describe "#offers" do
    context "when @offers set" do
      let(:offers) { [instance_double(EveOnline::ESI::Models::LoyaltyStoreOffer)] }

      before { subject.instance_variable_set(:@offers, offers) }

      specify { expect(subject.offers).to eq(offers) }
    end

    context "when @offers not set" do
      let(:loyalty_store_offer) { instance_double(EveOnline::ESI::Models::LoyaltyStoreOffer) }

      let(:response) do
        [
          {
            isk_cost: 2_400_000,
            lp_cost: 2_400,
            offer_id: 3_584,
            quantity: 5_000,
            required_items: [
              {
                quantity: 5_000,
                type_id: 234
              }
            ],
            type_id: 23_047
          }
        ]
      end

      before do
        #
        # subject.response # => [{"isk_cost"=>2400000, "lp_cost"=>2400, "offer_id"=>3584, "quantity"=>5000, "required_items"=>[{"quantity"=>5000, "type_id"=>234}], "type_id"=>23047}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::LoyaltyStoreOffer.new(response.first) # => loyalty_store_offer
        #
        expect(EveOnline::ESI::Models::LoyaltyStoreOffer).to receive(:new).with(response.first).and_return(loyalty_store_offer)
      end

      specify { expect(subject.offers).to eq([loyalty_store_offer]) }

      specify { expect { subject.offers }.to change { subject.instance_variable_get(:@offers) }.from(nil).to([loyalty_store_offer]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#roles" do
    specify { expect(subject.roles).to eq([]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/loyalty/stores/12345678/offers/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/loyalty/stores/12345678/offers/")
    end
  end
end
