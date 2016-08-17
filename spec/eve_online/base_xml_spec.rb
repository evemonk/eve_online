require 'spec_helper'

describe EveOnline::BaseXML do
  specify { expect(subject).to be_a(EveOnline::Base) }

  describe '#initialize' do
    let(:parser) { double }

    before do
      #
      # Nori.new(advanced_typecasting: false) => double
      #
      expect(Nori).to receive(:new).with(advanced_typecasting: false).and_return(parser)
    end

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
    let(:cached_until) { double }

    before do
      #
      # subject.eveapi.fetch('cachedUntil') => cached_until
      #
      expect(subject).to receive(:eveapi) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('cachedUntil').and_return(cached_until)
        end
      end
    end

    before do
      #
      # subject.parse_datetime_with_timezone(cached_until)
      #
      expect(subject).to receive(:parse_datetime_with_timezone).with(cached_until)
    end

    specify { expect { subject.cached_until }.not_to raise_error }
  end

  describe '#current_time' do
    let(:current_time) { double }

    before do
      #
      # subject.eveapi.fetch('currentTime') => current_time
      #
      expect(subject).to receive(:eveapi) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('currentTime').and_return(current_time)
        end
      end
    end

    before do
      #
      # subject.parse_datetime_with_timezone(current_time)
      #
      expect(subject).to receive(:parse_datetime_with_timezone).with(current_time)
    end

    specify { expect { subject.current_time }.not_to raise_error }
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

  # private methods

  describe '#parse_datetime_with_timezone' do
    let(:value) { double }

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(value)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(value)
        end
      end
    end

    specify { expect { subject.send(:parse_datetime_with_timezone, value) }.not_to raise_error }
  end
end
