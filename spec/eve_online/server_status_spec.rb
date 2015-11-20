require 'spec_helper'
require 'nori'

describe EveOnline::ServerStatus do
  before { stub_request(:any, subject.url) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/Server/ServerStatus.xml.aspx') }

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

  describe '#server_open?' do
    before do
      #
      # subject.result.fetch('serverOpen') == 'True'
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('serverOpen') do
            double.tap do |b|
              expect(b).to receive(:==).with('True')
            end
          end
        end
      end
    end

    specify { expect { subject.server_open? }.not_to raise_error }
  end

  describe '#online_players' do
    before do
      #
      # subject.result.fetch('onlinePlayers').to_i
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('onlinePlayers') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.online_players }.not_to raise_error }
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
    specify { expect(subject.url).to eq(described_class::API_ENDPOINT) }
  end
end
