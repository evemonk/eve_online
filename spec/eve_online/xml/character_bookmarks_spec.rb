require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::XML::CharacterBookmarks do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  subject { described_class.new(key_id, v_code) }

  specify { expect(subject).to be_a(EveOnline::XML::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/Bookmarks.xml.aspx') }

  specify { expect(described_class::ACCESS_MASK).to eq(268_435_456) }

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

      its(:character_id) { should eq(nil) }
    end

    context 'with options' do
      let(:options) { { character_id: 12_345_678 } }

      subject { described_class.new(key_id, v_code, options) }

      its(:character_id) { should eq(options[:character_id]) }
    end
  end

  describe '#bookmark_folders' do
    context 'row is Hash' do
      let(:bookmark_folder) { double }

      let(:row) do
        {
          'rowset' => {
            'row' => [
              {
                '@bookmarkID' => '726640415',
                '@creatorID' => '1337512245',
                '@created' => '2012-07-09 22:38:31',
                '@itemID' => '30003496',
                '@typeID' => '5',
                '@locationID' => '20000510',
                '@x' => '0',
                '@y' => '0',
                '@z' => '0',
                '@memo' => 'Nakri* (Solar System*)',
                '@note' => ''
              }
            ],
            '@name' => 'bookmarks',
            '@key' => 'bookmarkID',
            '@columns' => 'bookmarkID,creatorID,created,itemID,typeID,locationID,x,y,z,memo,note'
          },
          '@folderID' => '0',
          '@folderName' => ''
        }
      end

      before { expect(subject).to receive(:row).and_return(row).twice }

      before do
        #
        # EveOnline::BookmarkFolder.new(row) # => bookmark_folder
        #
        expect(EveOnline::BookmarkFolder).to receive(:new).with(row).and_return(bookmark_folder)
      end

      specify { expect(subject.bookmark_folders).to eq([bookmark_folder]) }

      specify { expect { subject.bookmark_folders }.to change { subject.instance_variable_defined?(:@_memoized_bookmark_folders) }.from(false).to(true) }
    end

    context 'row is Array' do
      let(:bookmark_folder) { double }

      let(:row) do
        [
          {
            'rowset' => {
              'row' => [
                {
                  '@bookmarkID' => '726640415',
                  '@creatorID' => '1337512245',
                  '@created' => '2012-07-09 22:38:31',
                  '@itemID' => '30003496',
                  '@typeID' => '5',
                  '@locationID' => '20000510',
                  '@x' => '0',
                  '@y' => '0',
                  '@z' => '0',
                  '@memo' => 'Nakri* (Solar System*)',
                  '@note' => ''
                }
              ],
              '@name' => 'bookmarks',
              '@key' => 'bookmarkID',
              '@columns' => 'bookmarkID,creatorID,created,itemID,typeID,locationID,x,y,z,memo,note'
            },
            '@folderID' => '0',
            '@folderName' => ''
          }
        ]
      end

      before { expect(subject).to receive(:row).and_return(row).twice }

      before do
        #
        # EveOnline::BookmarkFolder.new(row.first) # => bookmark_folder
        #
        expect(EveOnline::BookmarkFolder).to receive(:new).with(row.first).and_return(bookmark_folder)
      end

      specify { expect(subject.bookmark_folders).to eq([bookmark_folder]) }

      specify { expect { subject.bookmark_folders }.to change { subject.instance_variable_defined?(:@_memoized_bookmark_folders) }.from(false).to(true) }
    end

    context 'row is invalid' do
      before do
        #
        # subject.row # => 'invalid'
        #
        expect(subject).to receive(:row).and_return('invalid')
      end

      specify { expect { subject.bookmark_folders }.to raise_error(ArgumentError) }
    end
  end

  describe '#url' do
    context 'default' do
      specify do
        expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }")
      end
    end

    context 'with character_id' do
      let(:options) { { character_id: 12_345_678 } }

      subject { described_class.new(key_id, v_code, options) }

      specify do
        expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ options[:character_id] }")
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
