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

    before { expect(bookmark).to receive(:folder_name).and_return('') }

    subject { bookmark.as_json }

    its([:folder_id]) { should eq(0) }

    its([:folder_name]) { should eq('') }
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
end
