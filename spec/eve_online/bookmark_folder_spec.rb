require 'spec_helper'

describe EveOnline::BookmarkFolder do
  specify { expect(described_class).to be_a(Memoist) }

  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:bookmark) { described_class.new(options) }

    before { expect(bookmark).to receive(:folder_id).and_return(0) }

    before { expect(bookmark).to receive(:folder_name).and_return('LUT') }

    subject { bookmark.as_json }

    its([:folder_id]) { should eq(0) }

    its([:folder_name]) { should eq('LUT') }
  end

  describe '#folder_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@folderID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@folderID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.folder_id }.not_to raise_error }
  end

  describe '#folder_name' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@folderName')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@folderName')
        end
      end
    end

    specify { expect { subject.folder_name }.not_to raise_error }
  end

  # def bookmarks
  #   @bookmarks ||= begin
  #     case row
  #     when Hash
  #       [Bookmark.new(row)]
  #     when Array
  #       bookmarks = []
  #       row.each do |bookmark|
  #         bookmarks << Bookmark.new(bookmark)
  #       end
  #       bookmarks
  #     else
  #       raise ArgumentError
  #     end
  #   end
  # end

  describe '#bookmarks' do
    context 'row is Hash' do
      let(:options) { double }

      subject { described_class.new(options) }

      let(:bookmark) { double }

      let(:row) do
        {
          '@bookmarkID' => '459411933',
          '@creatorID' => '0',
          '@created' => '2009-03-28 07:51:00',
          '@itemID' => '0',
          '@typeID' => '5',
          '@locationID' => '30002656',
          '@x' => '-267396330161',
          '@y' => '-376627274',
          '@z' => '-556366331388',
          '@memo' => '1',
          '@note' => ''
        }
      end

      before do
        #
        # subject.row # => {"@bookmarkID"=>"459411933", "@creatorID"=>"0", "@created"=>"2009-03-28 07:51:00", "@itemID"=>"0", "@typeID"=>"5", "@locationID"=>"30002656", "@x"=>"-267396330161", "@y"=>"-376627274", "@z"=>"-556366331388", "@memo"=>"1", "@note"=>""}
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::Bookmark.new(row) # => bookmark
        #
        expect(EveOnline::Bookmark).to receive(:new).with(row).and_return(bookmark)
      end

      specify { expect(subject.bookmarks).to eq([bookmark]) }

      specify { expect { subject.bookmarks }.to change { subject.instance_variable_defined?(:@_memoized_bookmarks) }.from(false).to(true) }
    end

    context 'row is Array' do
      let(:options) { double }

      subject { described_class.new(options) }

      let(:bookmark) { double }

      let(:row) do
        [
          {
            '@bookmarkID' => '459411933',
            '@creatorID' => '0',
            '@created' => '2009-03-28 07:51:00',
            '@itemID' => '0',
            '@typeID' => '5',
            '@locationID' => '30002656',
            '@x' => '-267396330161',
            '@y' => '-376627274',
            '@z' => '-556366331388',
            '@memo' => '1',
            '@note' => ''
          }
        ]
      end

      before do
        #
        # subject.row # => [{"@bookmarkID"=>"459411933", "@creatorID"=>"0", "@created"=>"2009-03-28 07:51:00", "@itemID"=>"0", "@typeID"=>"5", "@locationID"=>"30002656", "@x"=>"-267396330161", "@y"=>"-376627274", "@z"=>"-556366331388", "@memo"=>"1", "@note"=>""}]
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::Bookmark.new(row.first) # => bookmark
        #
        expect(EveOnline::Bookmark).to receive(:new).with(row.first).and_return(bookmark)
      end

      specify { expect(subject.bookmarks).to eq([bookmark]) }

      specify { expect { subject.bookmarks }.to change { subject.instance_variable_defined?(:@_memoized_bookmarks) }.from(false).to(true) }
    end

    context 'row is invalid' do
      let(:options) { double }

      subject { described_class.new(options) }

      before do
        #
        # subject.row # => 'invalid'
        #
        expect(subject).to receive(:row).and_return('invalid')
      end

      specify { expect { subject.bookmarks }.to raise_error(ArgumentError) }
    end
  end

  # private methods

  describe '#rowset' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('rowset')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('rowset')
        end
      end
    end

    specify { expect { subject.send(:rowset) }.not_to raise_error }

    specify { expect { subject.send(:rowset) }.to change { subject.instance_variable_defined?(:@_memoized_rowset) }.from(false).to(true) }
  end

  describe '#row' do
    let(:options) { double }

    let(:rowset) { double }

    subject { described_class.new(options) }

    before { expect(subject).to receive(:rowset).and_return(rowset) }

    before do
      #
      # rowset.fetch('row')
      #
      expect(rowset).to receive(:fetch).with('row')
    end

    specify { expect { subject.send(:row) }.not_to raise_error }

    specify { expect { subject.send(:row) }.to change { subject.instance_variable_defined?(:@_memoized_row) }.from(false).to(true) }
  end
end
