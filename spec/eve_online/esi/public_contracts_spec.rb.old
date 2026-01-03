# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::PublicContracts do
  let(:options) { {region_id: 10_000_043} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/contracts/public/%<region_id>s/") }

  describe "#initialize" do
    context "without options" do
      its(:token) { should eq(nil) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      its(:_write_timeout) { should eq(60) }

      its(:region_id) { should eq(10_000_043) }

      its(:page) { should eq(1) }
    end

    context "with options" do
      let(:options) { {region_id: 10_000_043, page: 10} }

      its(:page) { should eq(10) }
    end
  end

  describe "#contracts" do
    context "when @contracts set" do
      let(:contracts) { [instance_double(EveOnline::ESI::Models::PublicContract)] }

      before { subject.instance_variable_set(:@contracts, contracts) }

      specify { expect(subject.contracts).to eq(contracts) }
    end

    context "when @contracts not set" do
      let(:contract) { instance_double(EveOnline::ESI::Models::PublicContract) }

      let(:response) do
        [
          {
            collateral: 0,
            contract_id: 186_482_104,
            date_expired: "2022-12-13T14:23:13Z",
            date_issued: "2022-11-15T14:23:13Z",
            days_to_complete: 0,
            end_location_id: 60_008_494,
            issuer_corporation_id: 98_553_759,
            issuer_id: 2_113_785_179,
            price: 1_999_000_000,
            reward: 0,
            start_location_id: 60_008_494,
            title: "Abyssal Deadspace Repairer",
            type: "item_exchange",
            volume: 50
          }
        ]
      end

      before do
        #
        # subject.response # => [{"collateral"=>0, "contract_id"=>186482104, "date_expired"=>"2022-12-13T14:23:13Z", "date_issued"=>"2022-11-15T14:23:13Z", "days_to_complete"=>0, "end_location_id"=>60008494, "issuer_corporation_id"=>98553759, "issuer_id"=>2113785179, "price"=>1999000000, "reward"=>0, "start_location_id"=>60008494, "title"=>"Abyssal Deadspace Repairer", "type"=>"item_exchange", "volume"=>50}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::PublicContract.new(response.first) # => contract
        #
        expect(EveOnline::ESI::Models::PublicContract).to receive(:new).with(response.first).and_return(contract)
      end

      specify { expect(subject.contracts).to eq([contract]) }

      specify { expect { subject.contracts }.to change { subject.instance_variable_get(:@contracts) }.from(nil).to([contract]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#additional_query_params" do
    specify { expect(subject.additional_query_params).to eq([:page]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/contracts/public/10000043/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq(page: 1)
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/contracts/public/10000043/?page=1")
    end
  end
end
