# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterMailLabels do
  let(:options) { {token: "token123", character_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v3/characters/%<character_id>s/mail/labels/") }

  describe "#initialize" do
    its(:token) { should eq("token123") }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe "#labels" do
    context "when @labels set" do
      let(:labels) { [instance_double(EveOnline::ESI::Models::MailLabel)] }

      before { subject.instance_variable_set(:@labels, labels) }

      specify { expect(subject.labels).to eq(labels) }
    end

    context "when @labels not set" do
      let(:label) { instance_double(EveOnline::ESI::Models::MailLabel) }

      let(:response) do
        [
          {
            color: "#ffffff",
            label_id: 8,
            name: "[Alliance]",
            unread_count: 0
          }
        ]
      end

      before do
        #
        # subject.response.fetch('labels') # => [{"color"=>"#ffffff", "label_id"=>8, "name"=>"[Alliance]", "unread_count"=>0}]
        #
        expect(subject).to receive(:response) do
          double.tap do |a|
            expect(a).to receive(:fetch).with("labels").and_return(response)
          end
        end
      end

      before do
        #
        # EveOnline::ESI::Models::MailLabel.new(response.first) # => label
        #
        expect(EveOnline::ESI::Models::MailLabel).to receive(:new).with(response.first).and_return(label)
      end

      specify { expect(subject.labels).to eq([label]) }

      specify { expect { subject.labels }.to change { subject.instance_variable_get(:@labels) }.from(nil).to([label]) }
    end
  end

  describe "#total_unread_count" do
    before do
      #
      # subject.response["total_unread_count"]
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with("total_unread_count")
        end
      end
    end

    specify { expect { subject.total_unread_count }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-mail.read_mail.v1") }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v3/characters/12345678/mail/labels/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v3/characters/12345678/mail/labels/")
    end
  end
end
