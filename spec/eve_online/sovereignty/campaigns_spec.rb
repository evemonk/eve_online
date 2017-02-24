require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::Sovereignty::Campaigns do
  specify { expect(subject).to be_a(EveOnline::BaseCREST) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://crest-tq.eveonline.com/sovereignty/campaigns/') }

  describe '#items' do
    before do
      #
      # subject.response.fetch('items')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('items')
        end
      end
    end

    specify { expect { subject.items }.not_to raise_error }
  end

  describe '#page_count' do
    before do
      #
      # subject.response.fetch('pageCount')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('pageCount')
        end
      end
    end

    specify { expect { subject.page_count }.not_to raise_error }
  end

  describe '#total_count' do
    before do
      #
      # subject.response.fetch('totalCount')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('totalCount')
        end
      end
    end

    specify { expect { subject.total_count }.not_to raise_error }
  end

  describe '#url' do
    specify { expect(subject.url).to eq(described_class::API_ENDPOINT) }
  end
end
