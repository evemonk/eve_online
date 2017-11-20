require 'spec_helper'

describe EveOnline::WalletJournalEntry do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:wallet_journal_entry) { described_class.new(options) }

    let(:date) { double }

    before { expect(wallet_journal_entry).to receive(:date).and_return(date) }

    before { expect(wallet_journal_entry).to receive(:ref_id).and_return(6_709_813_912) }

    before { expect(wallet_journal_entry).to receive(:ref_type_id).and_return(15) }

    before { expect(wallet_journal_entry).to receive(:owner_name1).and_return('reygar burnt') }

    before { expect(wallet_journal_entry).to receive(:owner_id1).and_return(1_801_683_792) }

    before { expect(wallet_journal_entry).to receive(:owner_name2).and_return('Wiyrkomi Corporation') }

    before { expect(wallet_journal_entry).to receive(:owner_id2).and_return(1_000_011) }

    before { expect(wallet_journal_entry).to receive(:arg_name1).and_return('EVE System') }

    before { expect(wallet_journal_entry).to receive(:arg_id1).and_return(1) }

    before { expect(wallet_journal_entry).to receive(:amount).and_return(-9250.00) }

    before { expect(wallet_journal_entry).to receive(:balance).and_return(385_574_791.30) }

    before { expect(wallet_journal_entry).to receive(:reason).and_return('some-reason') }

    before { expect(wallet_journal_entry).to receive(:tax_receiver_id).and_return('123') }

    before { expect(wallet_journal_entry).to receive(:tax_amount).and_return('tax-amount') }

    before { expect(wallet_journal_entry).to receive(:owner1_type_id).and_return(1_380) }

    before { expect(wallet_journal_entry).to receive(:owner2_type_id).and_return(2) }

    subject { wallet_journal_entry.as_json }

    its([:date]) { should eq(date) }

    its([:ref_id]) { should eq(6_709_813_912) }

    its([:ref_type_id]) { should eq(15) }

    its([:owner_name1]) { should eq('reygar burnt') }

    its([:owner_id1]) { should eq(1_801_683_792) }

    its([:owner_name2]) { should eq('Wiyrkomi Corporation') }

    its([:owner_id2]) { should eq(1_000_011) }

    its([:arg_name1]) { should eq('EVE System') }

    its([:arg_id1]) { should eq(1) }

    its([:amount]) { should eq(-9250.00) }

    its([:balance]) { should eq(385_574_791.30) }

    its([:reason]) { should eq('some-reason') }

    its([:tax_receiver_id]) { should eq('123') }

    its([:tax_amount]) { should eq('tax-amount') }

    its([:owner1_type_id]) { should eq(1_380) }

    its([:owner2_type_id]) { should eq(2) }
  end

  describe '#date' do
    let(:options) { double }

    subject { described_class.new(options) }

    let(:date) { double }

    before do
      #
      # subject.options.fetch('@date') => date
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@date').and_return(date)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(date)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(date)
        end
      end
    end

    specify { expect { subject.date }.not_to raise_error }
  end

  describe '#ref_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@refID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@refID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.ref_id }.not_to raise_error }
  end

  describe '#ref_type_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@refTypeID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@refTypeID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.ref_type_id }.not_to raise_error }
  end

  describe '#owner_name1' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@ownerName1')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@ownerName1')
        end
      end
    end

    specify { expect { subject.owner_name1 }.not_to raise_error }
  end

  describe '#owner_id1' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@ownerID1').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@ownerID1') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.owner_id1 }.not_to raise_error }
  end

  describe '#owner_name2' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@ownerName2')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@ownerName2')
        end
      end
    end

    specify { expect { subject.owner_name2 }.not_to raise_error }
  end

  describe '#owner_id2' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@ownerID2').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@ownerID2') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.owner_id2 }.not_to raise_error }
  end

  describe '#arg_name1' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@argName1')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@argName1')
        end
      end
    end

    specify { expect { subject.arg_name1 }.not_to raise_error }
  end

  describe '#arg_id1' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@argID1').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@argID1') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.arg_id1 }.not_to raise_error }
  end

  describe '#amount' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@amount').to_f
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@amount') do
            double.tap do |b|
              expect(b).to receive(:to_f)
            end
          end
        end
      end
    end

    specify { expect { subject.amount }.not_to raise_error }
  end

  describe '#balance' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@balance').to_f
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@balance') do
            double.tap do |b|
              expect(b).to receive(:to_f)
            end
          end
        end
      end
    end

    specify { expect { subject.balance }.not_to raise_error }
  end

  describe '#reason' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@reason')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@reason')
        end
      end
    end

    specify { expect { subject.reason }.not_to raise_error }
  end

  describe '#tax_receiver_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@taxReceiverID')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@taxReceiverID')
        end
      end
    end

    specify { expect { subject.tax_receiver_id }.not_to raise_error }
  end

  describe '#tax_amount' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@taxAmount')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@taxAmount')
        end
      end
    end

    specify { expect { subject.tax_amount }.not_to raise_error }
  end

  describe '#owner1_type_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@owner1TypeID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@owner1TypeID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.owner1_type_id }.not_to raise_error }
  end

  describe '#owner2_type_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@owner2TypeID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@owner2TypeID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.owner2_type_id }.not_to raise_error }
  end
end
