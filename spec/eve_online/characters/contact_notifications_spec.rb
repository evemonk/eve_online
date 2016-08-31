require 'spec_helper'

describe EveOnline::Characters::ContactNotifications do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  let(:character_id) { 12_345_678 }

  subject { described_class.new(key_id, v_code, character_id) }

  specify { expect(subject).to be_a(EveOnline::BaseXML) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/ContactNotifications.xml.aspx') }

  describe '#initialize' do
    let(:parser) { double }

    before do
      #
      # Nori.new(advanced_typecasting: false) => double
      #
      expect(Nori).to receive(:new).with(advanced_typecasting: false).and_return(parser)
    end

    its(:parser) { should eq(parser) }

    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }

    its(:character_id) { should eq(character_id) }
  end

  describe '#contact_notifications' do
    context 'row is Hash' do
      let(:contact_notification) { double }

      let(:row) do
        {
          '@notificationID' => '308734131',
          '@senderID' => '797400947',
          '@senderName' => 'CCP Garthagk',
          '@sentDate' => '2016-03-19 12:13:00',
          '@messageData' => "level: 5\nmessage: ''\n"
        }
      end

      before do
        #
        # subject.row # => {"@notificationID"=>"308734131", "@senderID"=>"797400947", "@senderName"=>"CCP Garthagk", "@sentDate"=>"2016-03-19 12:13:00", "@messageData"=>"level: 5\nmessage: ''\n"}
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::ContactNotification.new(row) # => contact_notification
        #
        expect(EveOnline::ContactNotification).to receive(:new).with(row).and_return(contact_notification)
      end

      specify { expect(subject.contact_notifications).to eq([contact_notification]) }
    end

    context 'row is Array' do
      let(:contact_notification) { double }

      let(:row) do
        [
          {
            '@notificationID' => '308734131',
            '@senderID' => '797400947',
            '@senderName' => 'CCP Garthagk',
            '@sentDate' => '2016-03-19 12:13:00',
            '@messageData' => "level: 5\nmessage: ''\n"
          }
        ]
      end

      before do
        #
        # subject.row # => [{"@notificationID"=>"308734131", "@senderID"=>"797400947", "@senderName"=>"CCP Garthagk", "@sentDate"=>"2016-03-19 12:13:00", "@messageData"=>"level: 5\nmessage: ''\n"}]
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::ContactNotification.new(row.first) # => contact_notification
        #
        expect(EveOnline::ContactNotification).to receive(:new).with(row.first).and_return(contact_notification)
      end

      specify { expect(subject.contact_notifications).to eq([contact_notification]) }
    end

    context 'row is invalid' do
      before do
        #
        # subject.row # => 'invalid'
        #
        expect(subject).to receive(:row).and_return('invalid')
      end

      specify { expect { subject.contact_notifications }.to raise_error(ArgumentError) }
    end
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }")
    end
  end

  # private methods

  describe '#row' do
    before do
      #
      # subject.rowset.fetch('row')
      #
      expect(subject).to receive(:rowset) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('row')
        end
      end
    end

    specify { expect { subject.send(:row) }.not_to raise_error }
  end

  describe '#rowset' do
    before do
      #
      # subject.result.fetch('rowset')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('rowset')
        end
      end
    end

    specify { expect { subject.send(:rowset) }.not_to raise_error }
  end
end
