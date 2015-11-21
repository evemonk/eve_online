require 'spec_helper'

describe EveOnline::Server::Status do
  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/Server/ServerStatus.xml.aspx') }

  describe '#as_json' do
    let(:server_status) { described_class.new }

    before do
      expect(server_status).to receive(:current_time)
        .and_return('2015-11-20 15:53:59')
    end

    before do
      expect(server_status).to receive(:cached_until)
        .and_return('2015-11-20 15:56:24')
    end

    before do
      expect(server_status).to receive(:server_open?)
        .and_return(true)
    end

    before do
      expect(server_status).to receive(:online_players)
        .and_return(19_808)
    end

    subject { server_status.as_json }

    its([:current_time]) { should eq('2015-11-20 15:53:59') }

    its([:cached_until]) { should eq('2015-11-20 15:56:24') }

    its([:server_open]) { should eq(true) }

    its([:online_players]) { should eq(19_808) }
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

  describe '#url' do
    specify { expect(subject.url).to eq(described_class::API_ENDPOINT) }
  end
end
