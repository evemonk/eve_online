require 'spec_helper'

describe EveOnline::Account::Status do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  subject { described_class.new(key_id, v_code) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/account/AccountStatus.xml.aspx') }

  describe '#initialize' do
    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }
  end

  describe '#as_json' do
    let(:account_status) { described_class.new(key_id, v_code) }

    let(:current_time) { double }
    
    let(:paid_until) { double }
    
    let(:create_date) { double }
    
    let(:cached_until) { double }

    before { expect(account_status).to receive(:current_time).and_return(current_time) }

    before { expect(account_status).to receive(:paid_until).and_return(paid_until) }

    before { expect(account_status).to receive(:create_date).and_return(create_date) }

    before { expect(account_status).to receive(:logon_count).and_return(388) }

    before { expect(account_status).to receive(:logon_minutes).and_return(15_598) }

    before { expect(account_status).to receive(:cached_until).and_return(cached_until) }

    subject { account_status.as_json }

    its([:current_time]) { should eq(current_time) }

    its([:paid_until]) { should eq(paid_until) }

    its([:create_date]) { should eq(create_date) }

    its([:logon_count]) { should eq(388) }

    its([:logon_minutes]) { should eq(15_598) }

    its([:cached_until]) { should eq(cached_until) }
  end

  describe '#paid_until' do
    let(:paid_until) { double }
    
    before do
      #
      # subject.result.fetch('paidUntil') => paid_until
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('paidUntil').and_return(paid_until)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(paid_until)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(paid_until)
        end
      end
    end

    specify { expect { subject.paid_until }.not_to raise_error }
  end

  describe '#create_date' do
    let(:create_date) { double }
    
    before do
      #
      # subject.result.fetch('createDate') => create_date
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('createDate').and_return(create_date)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(create_date)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(create_date)
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

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }")
    end
  end
end
