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

      its(:parser) { should eq(JSON) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("2.6.0")
        its(:_write_timeout) { should eq(60) }
      end

      its(:character_id) { should eq(12_345_678) }

      its(:page) { should eq(1) }
    end

    context "with options" do
      let(:options) { {token: "token123", character_id: 12_345_678, page: 10} }

      its(:page) { should eq(10) }
    end
  end

  describe "#contracts" do

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
