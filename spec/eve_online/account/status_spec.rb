require 'spec_helper'

describe EveOnline::Account::Status do
  let(:key_id) { '123' }

  let(:v_code) { 'abc' }

  subject { described_class.new(key_id, v_code) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/account/AccountStatus.xml.aspx') }

  describe '#as_json' do
    let(:account_status) { described_class.new(key_id, v_code) }

    before do
      expect(account_status).to receive(:current_time)
        .and_return('2015-11-20 23:02:48')
    end

    before do
      expect(account_status).to receive(:paid_until)
        .and_return('2015-11-28 18:12:56')
    end

    before do
      expect(account_status).to receive(:create_date)
        .and_return('2010-01-15 15:11:00')
    end

    before do
      expect(account_status).to receive(:logon_count)
        .and_return(388)
    end

    before do
      expect(account_status).to receive(:logon_minutes)
        .and_return(15_598)
    end

    before do
      expect(account_status).to receive(:cached_until)
        .and_return('2015-11-20 23:59:48')
    end

    subject { account_status.as_json }

    its([:current_time]) { should eq('2015-11-20 23:02:48') }

    its([:paid_until]) { should eq('2015-11-28 18:12:56') }

    its([:create_date]) { should eq('2010-01-15 15:11:00') }

    its([:logon_count]) { should eq(388) }

    its([:logon_minutes]) { should eq(15_598) }

    its([:cached_until]) { should eq('2015-11-20 23:59:48') }
  end

  describe '#paid_until' do
    before do
      #
      # subject.result.fetch('paidUntil')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('paidUntil')
        end
      end
    end

    specify { expect { subject.paid_until }.not_to raise_error }
  end

  describe '#create_date' do
    before do
      #
      # subject.result.fetch('createDate')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('createDate')
        end
      end
    end

    specify { expect { subject.create_date }.not_to raise_error }
  end

  describe '#logon_count' do
    before do
      #
      # subject.result.fetch('logonCount').to_i
      #
      expect(subject).to receive(:result) do
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
    before do
      #
      # subject.result.fetch('logonMinutes').to_i
      #
      expect(subject).to receive(:result) do
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

  describe '#cached_until' do
    before do
      #
      # subject.eveapi.fetch('cachedUntil')
      #
      expect(subject).to receive(:eveapi) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('cachedUntil')
        end
      end
    end

    specify { expect { subject.cached_until }.not_to raise_error }
  end

  describe '#version' do
    before do
      #
      # subject.eveapi.fetch('@version').to_i
      #
      expect(subject).to receive(:eveapi) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@version') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.version }.not_to raise_error }
  end

  describe '#result' do
    before do
      #
      # subject.eveapi.fetch('result')
      #
      expect(subject).to receive(:eveapi) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('result')
        end
      end
    end

    specify { expect { subject.result }.not_to raise_error }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }")
    end
  end
end
