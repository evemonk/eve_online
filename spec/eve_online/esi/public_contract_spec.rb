# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::PublicContract do
  let(:options) { {contract_id: 157_872_948} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/contracts/public/items/%<contract_id>s/") }

  describe "#initialize" do
    context "without options" do
      its(:token) { should eq(nil) }

      its(:parser) { should eq(JSON) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("2.6.0")
        its(:_write_timeout) { should eq(60) }
      end

      its(:contract_id) { should eq(157_872_948) }

      its(:page) { should eq(1) }
    end

    context "with options" do
      let(:options) { {contract_id: 157_872_948, page: 10} }

      its(:page) { should eq(10) }
    end
  end

  describe "#items" do
    context "when @items set" do
      let(:items) { [instance_double(EveOnline::ESI::Models::PublicContractItem)] }

      before { subject.instance_variable_set(:@items, items) }

      specify { expect(subject.items).to eq(items) }
    end

    context "when @items not set" do

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
      expect(subject.path).to eq("/v1/contracts/public/items/157872948/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq(page: 1)
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/contracts/public/items/157872948/?page=1")
    end
  end
end
