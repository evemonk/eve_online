require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::XML::Base do
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

  describe '#url' do
    specify { expect { subject.url }.to raise_error(NotImplementedError) }
  end

  describe '#user_agent' do
    specify { expect(subject.user_agent).to eq("EveOnline API (https://github.com/biow0lf/eve_online) v#{ EveOnline::VERSION }") }
  end

  describe '#content' do
    context 'ok' do
      let(:url) { double }

      before { expect(subject).to receive(:url).and_return(url) }

      let(:user_agent) { double }

      before { expect(subject).to receive(:user_agent).and_return(user_agent) }

      let(:faraday) { double }

      before do
        #
        # Faraday.new => faraday
        #
        expect(Faraday).to receive(:new).and_return(faraday)
      end

      before do
        #
        # faraday.headers[:user_agent] = user_agent
        #
        expect(faraday).to receive(:headers) do
          double.tap do |a|
            expect(a).to receive(:[]=).with(:user_agent, user_agent)
          end
        end
      end

      before do
        expect(faraday).to receive(:options) do
          double.tap do |a|
            expect(a).to receive(:timeout=).with(60)
          end
        end
      end

      before do
        expect(faraday).to receive(:options) do
          double.tap do |a|
            expect(a).to receive(:open_timeout=).with(60)
          end
        end
      end

      let(:resource) { double }

      before do
        #
        # faraday.get(url) => resource
        #
        expect(faraday).to receive(:get).with(url).and_return(resource)
      end

      before do
        #
        # resource.status => 200
        #
        expect(resource).to receive(:status).and_return(200)
      end

      before do
        #
        # resource.body
        #
        expect(resource).to receive(:body)
      end

      specify { expect { subject.content }.not_to raise_error }

      specify { expect { subject.content }.to change { subject.instance_variable_defined?(:@_memoized_content) }.from(false).to(true) }
    end

    context 'timeout' do
      before do
        #
        # Faraday.new => raise Faraday::TimeoutError
        #
        expect(Faraday).to receive(:new).and_raise(Faraday::TimeoutError)
      end

      specify { expect { subject.content }.to raise_error(EveOnline::Exceptions::TimeoutException) }
    end
  end

  describe '#response' do
    let(:parser) { double }

    let(:content) { 'some xml content to parse' }

    before { expect(subject).to receive(:content).and_return(content) }

    before { expect(subject).to receive(:parser).and_return(parser) }

    before { expect(parser).to receive(:parse).with(content) }

    specify { expect { subject.response }.not_to raise_error }

    specify { expect { subject.response }.to change { subject.instance_variable_defined?(:@_memoized_response) }.from(false).to(true) }
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

    specify { expect { subject.eveapi }.to change { subject.instance_variable_defined?(:@_memoized_eveapi) }.from(false).to(true) }
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

    specify { expect { subject.result }.to change { subject.instance_variable_defined?(:@_memoized_result) }.from(false).to(true) }
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

    specify { expect { subject.cached_until }.to change { subject.instance_variable_defined?(:@_memoized_cached_until) }.from(false).to(true) }
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

    specify { expect { subject.current_time }.to change { subject.instance_variable_defined?(:@_memoized_current_time) }.from(false).to(true) }
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

    specify { expect { subject.version }.to change { subject.instance_variable_defined?(:@_memoized_version) }.from(false).to(true) }
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
