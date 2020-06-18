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

      its(:parser) { should eq(JSON) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("2.6.0")
        its(:_write_timeout) { should eq(60) }
      end

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
            collateral: 0.0,
            contract_id: 157_834_735,
            date_expired: "2020-06-17T21:36:41Z",
            date_issued: "2020-05-20T21:36:41Z",
            days_to_complete: 0,
            end_location_id: 60008494,
            for_corporation: true,
            issuer_corporation_id: 897372069,
            issuer_id: 1314102096,
            price: 1250000000.0,
            reward: 0.0,
            start_location_id: 60008494,
            title: "ApostleMe10\/Te16 Complete Bpc 10 Pack",
            type: "item_exchange",
            volume: 100.0
          }
        ]
      end

      before do
        #
        # subject.response # => [{"collateral"=>0.0, "contract_id"=>157834735, "date_expired"=>"2020-06-17T21:36:41Z", "date_issued"=>"2020-05-20T21:36:41Z", "days_to_complete"=>0, "end_location_id"=>60008494, "for_corporation"=>true, "issuer_corporation_id"=>897372069, "issuer_id"=>1314102096, "price"=>1250000000.0, "reward"=>0.0, "start_location_id"=>60008494, "title"=>"ApostleMe10\/Te16 Complete Bpc 10 Pack", "type"=>"item_exchange", "volume"=>100.0}]
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
