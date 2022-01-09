# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterSendEmail do
  let(:options) do
    {
      token: "token123",
      character_id: 12_345_678,
      subject: "Test subject",
      body: "Test body",
      recipients: [
        {
          recipient_id: 12_345_679,
          recipient_type: "character"
        }
      ]
    }
  end

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/characters/%<character_id>s/mail/") }

  describe "#initialize" do
    context "with default approved_cost" do
      let(:options) do
        {
          token: "token123",
          character_id: 12_345_678,
          subject: "Test subject",
          body: "Test body",
          recipients: [
            {
              recipient_id: 12_345_679,
              recipient_type: "character"
            }
          ]
        }
      end

      its(:token) { should eq("token123") }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      its(:_write_timeout) { should eq(60) }

      its(:character_id) { should eq(12_345_678) }

      its(:subject) { should eq("Test subject") }

      its(:body) { should eq("Test body") }

      its(:recipients) { should eq([{recipient_id: 12_345_679, recipient_type: "character"}]) }

      its(:approved_cost) { should eq(0) }
    end

    context "with approved_cost" do
      let(:options) do
        {
          token: "token123",
          character_id: 12_345_678,
          subject: "Test subject",
          body: "Test body",
          recipients: [],
          approved_cost: 100
        }
      end

      its(:approved_cost) { should eq(100) }
    end
  end

  describe "#send_email" do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    specify { expect(subject.send_email).to eq(response) }
  end

  describe "#http_method" do
    specify { expect(subject.http_method).to eq(:post) }
  end

  describe "#payload" do
    let(:payload) do
      {
        approved_cost: 0,
        body: "Test body",
        recipients: [
          {
            recipient_id: 12_345_679,
            recipient_type: "character"
          }
        ],
        subject: "Test subject"
      }.to_json
    end

    specify { expect(subject.payload).to eq(payload) }
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

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/characters/12345678/mail/")
    end
  end
end
