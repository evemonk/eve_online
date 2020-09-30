# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Killmail do
  let(:options) do
    {
      killmail_id: 81_646_519,
      killmail_hash: "8f1450fca8ce97be9b10e106a1257088407ef387"
    }
  end

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/killmails/%<killmail_id>s/%<killmail_hash>s/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:killmail_id) { should eq(81_646_519) }

    its(:killmail_hash) { should eq("8f1450fca8ce97be9b10e106a1257088407ef387") }
  end

  describe "#as_json" do
    specify { expect(subject.as_json).to eq({}) }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/killmails/81646519/8f1450fca8ce97be9b10e106a1257088407ef387/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/killmails/81646519/8f1450fca8ce97be9b10e106a1257088407ef387/")
    end
  end
end
