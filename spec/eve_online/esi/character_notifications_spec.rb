# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterNotifications do
  let(:options) { {token: "token123", character_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v5/characters/%<character_id>s/notifications/") }

  describe "#initialize" do
    its(:token) { should eq("token123") }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe "#notifications" do
    context "when @notifications set" do
      let(:notifications) { [instance_double(EveOnline::ESI::Models::Notification)] }

      before { subject.instance_variable_set(:@notifications, notifications) }

      specify { expect(subject.notifications).to eq(notifications) }
    end

    context "when @notifications not set" do
      let(:notification) { instance_double(EveOnline::ESI::Models::Notification) }

      let(:response) do
        [
          {
            notification_id: 774_328_832,
            type: "AllWarDeclaredMsg",
            sender_id: 1_000_125,
            sender_type: "corporation",
            timestamp: "2018-03-01T13:48:00Z",
            text: 'againstID: 99005443\ncost: 0\ndeclaredByID: 98442842\ndelayHours: 24\nhostileState: 0\n'
          }
        ]
      end

      before do
        #
        # subject.response # => [{"notification_id"=>774328832, "type"=>"AllWarDeclaredMsg", "sender_id"=>1000125, "sender_type"=>"corporation", "timestamp"=>"2018-03-01T13:48:00Z", "text"=>"againstID: 99005443\ncost: 0\ndeclaredByID: 98442842\ndelayHours: 24\nhostileState: 0\n"}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::Notification.new(response.first) # => notification
        #
        expect(EveOnline::ESI::Models::Notification).to receive(:new).with(response.first).and_return(notification)
      end

      specify { expect(subject.notifications).to eq([notification]) }

      specify { expect { subject.notifications }.to change { subject.instance_variable_get(:@notifications) }.from(nil).to([notification]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-characters.read_notifications.v1") }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v5/characters/12345678/notifications/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v5/characters/12345678/notifications/")
    end
  end
end
