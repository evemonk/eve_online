require 'spec_helper'

describe EveOnline::Base do
  describe '#initialize' do
    let(:key_id) { '123key' }

    let(:v_code) { '123v_code' }

    let(:parser) { Nori.new }

    subject { described_class.new(key_id, v_code, parser) }

    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }

    its(:parser) { should eq(parser) }
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

  describe '#cached_until' do
    before do
      #
      # subject.eveapi.fetch('cachedUntil') => '2015-11-22 16:47:40'
      #
      expect(subject).to receive(:eveapi) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('cachedUntil').and_return('2015-11-22 16:47:40')
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(eveapi.fetch('cachedUntil'))
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with('2015-11-22 16:47:40')
        end
      end
    end

    specify { expect { subject.cached_until }.not_to raise_error }
  end

  describe '#current_time' do
    before do
      #
      # subject.eveapi.fetch('currentTime') => '2015-11-22 16:47:40'
      #
      expect(subject).to receive(:eveapi) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('currentTime').and_return('2015-11-22 16:47:40')
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(eveapi.fetch('currentTime'))
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with('2015-11-22 16:47:40')
        end
      end
    end

    specify { expect { subject.current_time }.not_to raise_error }
  end

  describe '#version' do
    specify { expect { subject.version }.to raise_error(NotImplementedError) }
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
    specify { expect { subject.url }.to raise_error(NotImplementedError) }
  end

  describe '#content' do
    let(:url) { 'https://google.com/' }

    before { expect(subject).to receive(:url).and_return(url) }

    before do
      #
      # subject.open(url).read
      #
      expect(subject).to receive(:open).with(url, open_timeout: 60, read_timeout: 60) do
        double.tap do |a|
          expect(a).to receive(:read)
        end
      end
    end

    specify { expect { subject.content }.not_to raise_error }
  end

  describe '#response' do
    let(:parser) { double }

    let(:content) { 'some xml content' }

    before { expect(subject).to receive(:content).and_return(content) }

    before { expect(subject).to receive(:parser).and_return(parser) }

    before { expect(parser).to receive(:parse).with(content) }

    specify { expect { subject.response }.not_to raise_error }
  end
end
