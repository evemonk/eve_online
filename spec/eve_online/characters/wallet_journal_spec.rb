require 'spec_helper'

describe EveOnline::Characters::WalletJournal do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  let(:character_id) { 12_345_678 }

  subject { described_class.new(key_id, v_code, character_id) }

  specify { expect(subject).to be_a(EveOnline::BaseXML) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/WalletJournal.xml.aspx') }

  specify { expect(described_class::ACCESS_MASK).to eq(2_097_152) }

  describe '#initialize' do
    context 'default' do
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

      its(:account_key) { should eq(1_000) }

      its(:from_id) { should eq(nil) }

      its(:row_count) { should eq(nil) }
    end

    context 'with options' do
      let(:options) do
        {
          account_key: 1_234,
          from_id: 12_345,
          row_count: 512
        }
      end

      subject { described_class.new(key_id, v_code, character_id, options) }

      its(:account_key) { should eq(1_234) }

      its(:from_id) { should eq(12_345) }

      its(:row_count) { should eq(512) }
    end
  end

  describe '#wallet_journal_entries' do
    context 'row is Hash' do
      let(:wallet_journal_entry) { double }

      let(:row) do
        {
          '@date' => '2016-09-01 20:01:57',
          '@refID' => '6709813912',
          '@refTypeID' => '15',
          '@ownerName1' => 'reygar burnt',
          '@ownerID1' => '1801683792',
          '@ownerName2' => 'Wiyrkomi Corporation',
          '@ownerID2' => '1000011',
          '@argName1' => 'EVE System',
          '@argID1' => '1',
          '@amount' => '-9250.00',
          '@balance' => '385574791.30',
          '@reason' => '',
          '@taxReceiverID' => '',
          '@taxAmount' => '',
          '@owner1TypeID' => '1380',
          '@owner2TypeID' => '2'
        }
      end

      before do
        #
        # subject.row # => {"@date"=>"2016-09-01 20:01:57", "@refID"=>"6709813912", "@refTypeID"=>"15", "@ownerName1"=>"reygar burnt", "@ownerID1"=>"1801683792", "@ownerName2"=>"Wiyrkomi Corporation", "@ownerID2"=>"1000011", "@argName1"=>"EVE System", "@argID1"=>"1", "@amount"=>"-9250.00", "@balance"=>"385574791.30", "@reason"=>"", "@taxReceiverID"=>"", "@taxAmount"=>"", "@owner1TypeID"=>"1380", "@owner2TypeID"=>"2"}
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::WalletJournalEntry.new(row) # => wallet_journal_entry
        #
        expect(EveOnline::WalletJournalEntry).to receive(:new).with(row).and_return(wallet_journal_entry)
      end

      specify { expect(subject.wallet_journal_entries).to eq([wallet_journal_entry]) }

      specify { expect { subject.wallet_journal_entries }.to change { subject.instance_variable_defined?(:@_memoized_wallet_journal_entries) }.from(false).to(true) }
    end

    context 'row is Array' do
      let(:wallet_journal_entry) { double }

      let(:row) do
        [
          {
            '@date' => '2016-09-01 20:01:57',
            '@refID' => '6709813912',
            '@refTypeID' => '15',
            '@ownerName1' => 'reygar burnt',
            '@ownerID1' => '1801683792',
            '@ownerName2' => 'Wiyrkomi Corporation',
            '@ownerID2' => '1000011',
            '@argName1' => 'EVE System',
            '@argID1' => '1',
            '@amount' => '-9250.00',
            '@balance' => '385574791.30',
            '@reason' => '',
            '@taxReceiverID' => '',
            '@taxAmount' => '',
            '@owner1TypeID' => '1380',
            '@owner2TypeID' => '2'
          }
        ]
      end

      before do
        #
        # subject.row # => [{"@date"=>"2016-09-01 20:01:57", "@refID"=>"6709813912", "@refTypeID"=>"15", "@ownerName1"=>"reygar burnt", "@ownerID1"=>"1801683792", "@ownerName2"=>"Wiyrkomi Corporation", "@ownerID2"=>"1000011", "@argName1"=>"EVE System", "@argID1"=>"1", "@amount"=>"-9250.00", "@balance"=>"385574791.30", "@reason"=>"", "@taxReceiverID"=>"", "@taxAmount"=>"", "@owner1TypeID"=>"1380", "@owner2TypeID"=>"2"}]
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::WalletJournalEntry.new(row.first) # => wallet_journal_entry
        #
        expect(EveOnline::WalletJournalEntry).to receive(:new).with(row.first).and_return(wallet_journal_entry)
      end

      specify { expect(subject.wallet_journal_entries).to eq([wallet_journal_entry]) }

      specify { expect { subject.wallet_journal_entries }.to change { subject.instance_variable_defined?(:@_memoized_wallet_journal_entries) }.from(false).to(true) }
    end

    context 'row is invalid' do
      before do
        #
        # subject.row # => 'invalid'
        #
        expect(subject).to receive(:row).and_return('invalid')
      end

      specify { expect { subject.wallet_journal_entries }.to raise_error(ArgumentError) }
    end
  end

  describe '#url' do
    context 'default' do
      specify do
        expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&accountKey=1000")
      end
    end

    context 'with from_id' do
      let(:options) { { from_id: 1_234_567 } }

      subject { described_class.new(key_id, v_code, character_id, options) }

      specify do
        expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&accountKey=1000&fromID=#{ options[:from_id] }")
      end
    end

    context 'with row_count' do
      let(:options) { { row_count: 512 } }

      subject { described_class.new(key_id, v_code, character_id, options) }

      specify do
        expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&accountKey=1000&rowCount=#{ options[:row_count] }")
      end
    end
  end

  # private methods

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

    specify { expect { subject.send(:rowset) }.to change { subject.instance_variable_defined?(:@_memoized_rowset) }.from(false).to(true) }
  end

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

    specify { expect { subject.send(:row) }.to change { subject.instance_variable_defined?(:@_memoized_row) }.from(false).to(true) }
  end
end
