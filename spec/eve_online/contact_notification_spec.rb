require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::ContactNotification do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:contact_notification) { described_class.new(options) }

    let(:sent_date) { double }

    before { expect(contact_notification).to receive(:notification_id).and_return(308_734_131) }

    before { expect(contact_notification).to receive(:sender_id).and_return(797_400_947) }

    before { expect(contact_notification).to receive(:sender_name).and_return('CCP Garthagk') }

    before { expect(contact_notification).to receive(:sent_date).and_return(sent_date) }

    before { expect(contact_notification).to receive(:message_data).and_return('message') }

    subject { contact_notification.as_json }

    its([:notification_id]) { should eq(308_734_131) }

    its([:sender_id]) { should eq(797_400_947) }

    its([:sender_name]) { should eq('CCP Garthagk') }

    its([:sent_date]) { should eq(sent_date) }

    its([:message_data]) { should eq('message') }
  end

  describe '#notification_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@notificationID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@notificationID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.notification_id }.not_to raise_error }
  end

  describe '#sender_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@senderID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@senderID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.sender_id }.not_to raise_error }
  end

  describe '#sender_name' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@senderName')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@senderName')
        end
      end
    end

    specify { expect { subject.sender_name }.not_to raise_error }
  end

  describe '#sent_date' do
    let(:options) { double }

    subject { described_class.new(options) }

    let(:sent_date) { double }

    before do
      #
      # subject.options.fetch('@sentDate') => sent_date
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@sentDate').and_return(sent_date)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(sent_date)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(sent_date)
        end
      end
    end

    specify { expect { subject.sent_date }.not_to raise_error }
  end

  describe '#message_data' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@messageData')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@messageData')
        end
      end
    end

    specify { expect { subject.message_data }.not_to raise_error }
  end
end
