require 'spec_helper'

describe EveOnline::ESI::ServerStatus do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v1/status/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }
  end

  describe '#as_json' do
    # TODO
  end

  describe '#start_time' do
    context 'start_time is present' do
      let(:start_time) { double }

      before do
        #
        # subject.response['start_time'] => start_time
        #
        expect(subject).to receive(:response) do
          double.tap do |a|
            expect(a).to receive(:[]).with('start_time').and_return(start_time)
          end
        end
      end

      before do
        #
        # subject.parse_datetime_with_timezone(start_time)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(start_time)
      end

      specify { expect { subject.start_time }.not_to raise_error }
    end

    context 'start_time not present' do
      before do
        #
        # subject.response['start_time'] => nil
        #
        expect(subject).to receive(:response) do
          double.tap do |a|
            expect(a).to receive(:[]).with('start_time').and_return(nil)
          end
        end
      end

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.start_time }.not_to raise_error }
    end
  end

  describe '#players' do
    before do
      #
      # subject.response['players']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('players')
        end
      end
    end

    specify { expect { subject.players }.not_to raise_error }
  end

  describe '#server_version' do
    before do
      #
      # subject.response['server_version']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('server_version')
        end
      end
    end

    specify { expect { subject.server_version }.not_to raise_error }
  end

  describe '#vip' do
    before do
      #
      # subject.response['vip']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('vip')
        end
      end
    end

    specify { expect { subject.vip }.not_to raise_error }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq(described_class::API_ENDPOINT)
    end
  end
end
