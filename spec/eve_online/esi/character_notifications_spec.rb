require 'spec_helper'

describe EveOnline::ESI::CharacterNotifications do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v1/characters/%<character_id>s/notifications/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq('token123') }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe '#notifications' do
    let(:notification) { double }

    let(:response) do
      [
        {
          'notification_id' => 774_328_832,
          'type' => 'AllWarDeclaredMsg',
          'sender_id' => 1_000_125,
          'sender_type' => 'corporation',
          'timestamp' => '2018-03-01T13:48:00Z',
          'text' => 'againstID: 99005443\ncost: 0\ndeclaredByID: 98442842\ndelayHours: 24\nhostileState: 0\n'
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

    specify { expect { subject.notifications }.to change { subject.instance_variable_defined?(:@_memoized_notifications) }.from(false).to(true) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-characters.read_notifications.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v1/characters/12345678/notifications/?datasource=tranquility')
    end
  end
end
