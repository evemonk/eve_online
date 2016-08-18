require 'spec_helper'

describe EveOnline::BookmarkFolder do
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
  end
end
