require 'spec_helper'

describe EveOnline::XML::Models::AccountStatus do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:account_status) { described_class.new(options) }

    let(:paid_until) { double }

    let(:create_date) { double }

    let(:logon_count) { double }

    let(:logon_minutes) { double }

    before { expect(account_status).to receive(:paid_until).and_return(paid_until) }

    before { expect(account_status).to receive(:create_date).and_return(create_date) }

    before { expect(account_status).to receive(:logon_count).and_return(logon_count) }

    before { expect(account_status).to receive(:logon_minutes).and_return(logon_minutes) }

    subject { account_status.as_json }

    its([:paid_until]) { should eq(paid_until) }

    its([:create_date]) { should eq(create_date) }

    its([:logon_count]) { should eq(logon_count) }

    its([:logon_minutes]) { should eq(logon_minutes) }
  end

  describe '#paid_until' do
    let(:options) { double }

    subject { described_class.new(options) }

    let(:paid_until) { double }

    before do
      #
      # subject.options.fetch('paidUntil') => paid_until
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('paidUntil').and_return(paid_until)
        end
      end
    end

    before do
      #
      # subject.parse_datetime_with_timezone(paid_until)
      #
      expect(subject).to receive(:parse_datetime_with_timezone).with(paid_until)
    end

    specify { expect { subject.paid_until }.not_to raise_error }
  end

  describe '#create_date' do
    let(:options) { double }

    subject { described_class.new(options) }

    let(:create_date) { double }

    before do
      #
      # subject.options.fetch('createDate') => create_date
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('createDate').and_return(create_date)
        end
      end
    end

    before do
      #
      # subject.parse_datetime_with_timezone(create_date)
      #
      expect(subject).to receive(:parse_datetime_with_timezone).with(create_date)
    end

    specify { expect { subject.create_date }.not_to raise_error }
  end

  describe '#logon_count' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('logonCount').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('logonCount') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.logon_count }.not_to raise_error }
  end

  describe '#logon_minutes' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('logonMinutes').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('logonMinutes') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.logon_minutes }.not_to raise_error }
  end
end
