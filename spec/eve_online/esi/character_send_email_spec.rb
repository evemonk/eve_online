# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterSendEmail do
  let(:options) { {character_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/characters/%<character_id>s/mail/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe "#send_email" do
    specify { expect { subject.send_email }.not_to raise_error }
  end

  describe "#http_method" do
    specify { expect(subject.http_method).to eq(:post) }
  end

  describe "#payload" do
    specify { expect { subject.payload }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-mail.send_mail.v1") }
  end

  describe "#etag" do
    specify { expect { subject.etag }.to raise_error(NotImplementedError) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/characters/12345678/mail/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/characters/12345678/mail/")
    end
  end
end
