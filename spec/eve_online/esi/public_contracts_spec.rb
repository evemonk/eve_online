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
      # TODO: write
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
