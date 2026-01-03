# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterContracts do
  let(:options) { {token: "token123", character_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/characters/%<character_id>s/contracts/") }

  describe "#initialize" do
    context "without options" do
      its(:token) { should eq("token123") }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      its(:_write_timeout) { should eq(60) }

      its(:character_id) { should eq(12_345_678) }

      its(:page) { should eq(1) }
    end

    context "with options" do
      let(:options) { {token: "token123", character_id: 12_345_678, page: 10} }

      its(:page) { should eq(10) }
    end
  end

  describe "#contracts" do
    context "when @contracts set" do
      let(:contracts) { [instance_double(EveOnline::ESI::Models::Contract)] }

      before { subject.instance_variable_set(:@contracts, contracts) }

      specify { expect(subject.contracts).to eq(contracts) }
    end

    context "when @contracts not set" do
      let(:contract) { instance_double(EveOnline::ESI::Models::Contract) }

      let(:response) do
        [
          {
            acceptor_id: 2116199184,
            assignee_id: 2116199184,
            availability: "personal",
            collateral: 0.0,
            contract_id: 154837125,
            date_accepted: "2020-03-06T21:09:32Z",
            date_completed: "2020-03-06T21:09:32Z",
            date_expired: "2020-03-07T21:09:11Z",
            date_issued: "2020-03-06T21:09:11Z",
            days_to_complete: 0,
            end_location_id: 60008674,
            for_corporation: false,
            issuer_corporation_id: 98134807,
            issuer_id: 1337512245,
            price: 0.0,
            reward: 0.0,
            start_location_id: 60008674,
            status: "finished",
            title: "",
            type: "item_exchange",
            volume: 15000.0
          }
        ]
      end

      before do
        #
        # subject.response # => [{"acceptor_id":2116199184,"assignee_id":2116199184,"availability":"personal","collateral":0.0,"contract_id":154837125,"date_accepted":"2020-03-06T21:09:32Z","date_completed":"2020-03-06T21:09:32Z","date_expired":"2020-03-07T21:09:11Z","date_issued":"2020-03-06T21:09:11Z","days_to_complete":0,"end_location_id":60008674,"for_corporation":false,"issuer_corporation_id":98134807,"issuer_id":1337512245,"price":0.0,"reward":0.0,"start_location_id":60008674,"status":"finished","title":"","type":"item_exchange","volume":15000.0}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::Contract.new(response.first) # => contract
        #
        expect(EveOnline::ESI::Models::Contract).to receive(:new).with(response.first).and_return(contract)
      end

      specify { expect(subject.contracts).to eq([contract]) }

      specify { expect { subject.contracts }.to change { subject.instance_variable_get(:@contracts) }.from(nil).to([contract]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-contracts.read_character_contracts.v1") }
  end

  describe "#additional_query_params" do
    specify { expect(subject.additional_query_params).to eq([:page]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/characters/12345678/contracts/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq(page: 1)
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/characters/12345678/contracts/?page=1")
    end
  end
end
