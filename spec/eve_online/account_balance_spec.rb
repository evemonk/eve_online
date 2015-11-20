require 'spec_helper'
require 'nori'

describe EveOnline::AccountBalance do
  let(:key_id) { '123' }

  let(:v_code) { 'abc' }

  subject { described_class.new(key_id, v_code) }

  before { stub_request(:any, subject.url) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/AccountBalance.xml.aspx') }

  describe '#current_time' do
    before do
      #
      # subject.eveapi.fetch('currentTime')
      #
      expect(subject).to receive(:eveapi) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('currentTime')
        end
      end
    end

    specify { expect { subject.current_time }.not_to raise_error }
  end

  describe '#account_id' do
    before do
      #
      # subject.row.fetch('@accountID').to_i
      #
      expect(subject).to receive(:row) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@accountID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.account_id }.not_to raise_error }
  end

  describe '#account_key' do
    before do
      #
      # subject.row.fetch('@accountKey')
      #
      expect(subject).to receive(:row) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@accountKey')
        end
      end
    end

    specify { expect { subject.account_key }.not_to raise_error }
  end

  describe '#balance' do
    before do
      #
      # subject.row.fetch('@balance')
      #
      expect(subject).to receive(:row) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@balance')
        end
      end
    end

    specify { expect { subject.balance }.not_to raise_error }
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

    specify { expect { subject.row }.not_to raise_error }
  end

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

    specify { expect { subject.rowset }.not_to raise_error }
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

  describe '#eveapi' do
    before do
      #
      # subject.response.fetch('eveapi')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('eveapi')
        end
      end
    end

    specify { expect { subject.eveapi }.not_to raise_error }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }")
    end
  end
end
