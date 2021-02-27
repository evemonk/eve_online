# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CorporationMembers do
  let(:options) { {token: "token123", corporation_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v3/corporations/%<corporation_id>s/members/") }

  describe "#initialize" do
    its(:token) { should eq("token123") }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:corporation_id) { should eq(12_345_678) }
  end

  describe "#character_ids" do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    specify { expect(subject.character_ids).to eq(response) }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-corporations.read_corporation_membership.v1") }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v3/corporations/12345678/members/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v3/corporations/12345678/members/")
    end
  end
end
