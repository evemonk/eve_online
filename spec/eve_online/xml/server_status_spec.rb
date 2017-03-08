require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::XML::ServerStatus do
  specify { expect(subject).to be_a(EveOnline::BaseXML) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/Server/ServerStatus.xml.aspx') }

  describe '#as_json' do
    let(:server_status) { described_class.new }

    let(:current_time) { double }

    let(:cached_until) { double }

    before { expect(server_status).to receive(:current_time).and_return(current_time) }

    before { expect(server_status).to receive(:cached_until).and_return(cached_until) }

    before { expect(server_status).to receive(:server_open).and_return(true) }

    before { expect(server_status).to receive(:online_players).and_return(19_808) }

    subject { server_status.as_json }

    its([:current_time]) { should eq(current_time) }

    its([:cached_until]) { should eq(cached_until) }

    its([:server_open]) { should eq(true) }

    its([:online_players]) { should eq(19_808) }
  end

  describe '#server_open' do
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

    specify { expect { subject.server_open }.not_to raise_error }
  end

  it { should respond_to?(:server_open?) }

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

  describe '#url' do
    specify { expect(subject.url).to eq(described_class::API_ENDPOINT) }
  end
end
