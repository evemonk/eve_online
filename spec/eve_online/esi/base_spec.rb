# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Base do
  specify { expect(described_class::API_HOST).to eq("esi.evetech.net") }

  describe "#initialize" do
    context "with options" do
      let(:adapter) { double }

      let(:middlewares) { double }

      let(:options) do
        {
          token: "token123",
          read_timeout: 30,
          open_timeout: 45,
          write_timeout: 50,
          language: "ru",
          adapter: adapter,
          middlewares: middlewares
        }
      end

      subject { described_class.new(options) }

      its(:token) { should eq("token123") }

      its(:_read_timeout) { should eq(30) }

      its(:_open_timeout) { should eq(45) }

      its(:_write_timeout) { should eq(50) }

      its(:language) { should eq("ru") }

      its(:adapter) { should eq(adapter) }

      its(:middlewares) { should eq(middlewares) }
    end

    context "without options" do
      its(:token) { should eq(nil) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      its(:_write_timeout) { should eq(60) }

      its(:language) { should eq("en-us") }

      its(:adapter) { should eq(Faraday.default_adapter) }

      its(:middlewares) { should eq([]) }
    end
  end

  describe "#url" do
    before do
      #
      # subject.uri.to_s
      #
      expect(subject).to receive(:uri) do
        double.tap do |a|
          expect(a).to receive(:to_s)
        end
      end
    end

    specify { expect { subject.url }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect { subject.scope }.to raise_error(NotImplementedError) }
  end

  describe "#user_agent" do
    specify { expect(subject.user_agent).to eq("EveOnline API (https://github.com/evemonk/eve_online) v#{EveOnline::VERSION}") }
  end

  describe "#http_method" do
    specify { expect(subject.http_method).to eq(:get) }
  end

  describe "#read_timeout" do
    before do
      #
      # subject.connection.options.read_timeout
      #
      expect(subject).to receive(:connection) do
        double.tap do |a|
          expect(a).to receive(:options) do
            double.tap do |b|
              expect(b).to receive(:read_timeout)
            end
          end
        end
      end
    end

    specify { expect { subject.read_timeout }.not_to raise_error }
  end

  describe "#read_timeout=" do
    let(:value) { double }

    before do
      #
      # subject.connection.options.read_timeout = value
      #
      expect(subject).to receive(:connection) do
        double.tap do |a|
          expect(a).to receive(:options) do
            double.tap do |b|
              expect(b).to receive(:read_timeout=).with(value)
            end
          end
        end
      end
    end

    specify { expect { subject.send(:read_timeout=, value) }.not_to raise_error }
  end

  describe "#open_timeout" do
    before do
      #
      # subject.connection.options.open_timeout
      #
      expect(subject).to receive(:connection) do
        double.tap do |a|
          expect(a).to receive(:options) do
            double.tap do |b|
              expect(b).to receive(:open_timeout)
            end
          end
        end
      end
    end

    specify { expect { subject.open_timeout }.not_to raise_error }
  end

  describe "#open_timeout=" do
    let(:value) { double }

    before do
      #
      # subject.connection.options.open_timeout = value
      #
      expect(subject).to receive(:connection) do
        double.tap do |a|
          expect(a).to receive(:options) do
            double.tap do |b|
              expect(b).to receive(:open_timeout=).with(value)
            end
          end
        end
      end
    end

    specify { expect { subject.send(:open_timeout=, value) }.not_to raise_error }
  end

  describe "#write_timeout" do
    before do
      #
      # subject.connection.options.write_timeout
      #
      expect(subject).to receive(:connection) do
        double.tap do |a|
          expect(a).to receive(:options) do
            double.tap do |b|
              expect(b).to receive(:write_timeout)
            end
          end
        end
      end
    end

    specify { expect { subject.write_timeout }.not_to raise_error }
  end

  describe "#write_timeout=" do
    let(:value) { double }

    before do
      #
      # subject.connection.options.write_timeout = value
      #
      expect(subject).to receive(:connection) do
        double.tap do |a|
          expect(a).to receive(:options) do
            double.tap do |b|
              expect(b).to receive(:write_timeout=).with(value)
            end
          end
        end
      end
    end

    specify { expect { subject.send(:write_timeout=, value) }.not_to raise_error }
  end

  describe "#page" do
    specify { expect(subject.page).to eq(nil) }
  end

  describe "#total_pages" do
    let(:resource) { double }

    let(:headers) { double }

    let(:value) { double }

    before { expect(subject).to receive(:resource).and_return(resource) }

    before { expect(resource).to receive(:headers).and_return(headers) }

    before { expect(headers).to receive(:[]).with("x-pages").and_return(value) }

    before { expect(value).to receive(:to_i) }

    specify { expect { subject.total_pages }.not_to raise_error }
  end

  describe "#error_limit_remain" do
    let(:resource) { double }

    let(:headers) { double }

    let(:value) { double }

    before { expect(subject).to receive(:resource).and_return(resource) }

    before { expect(resource).to receive(:headers).and_return(headers) }

    before { expect(headers).to receive(:[]).with("x-esi-error-limit-remain").and_return(value) }

    before { expect(value).to receive(:to_i) }

    specify { expect { subject.error_limit_remain }.not_to raise_error }
  end

  describe "#error_limit_reset" do
    let(:resource) { double }

    let(:headers) { double }

    let(:value) { double }

    before { expect(subject).to receive(:resource).and_return(resource) }

    before { expect(resource).to receive(:headers).and_return(headers) }

    before { expect(headers).to receive(:[]).with("x-esi-error-limit-reset").and_return(value) }

    before { expect(value).to receive(:to_i) }

    specify { expect { subject.error_limit_reset }.not_to raise_error }
  end

  describe "#request_id" do
    let(:resource) { double }

    let(:headers) { double }

    before { expect(subject).to receive(:resource).and_return(resource) }

    before { expect(resource).to receive(:headers).and_return(headers) }

    before { expect(headers).to receive(:[]).with("x-esi-request-id") }

    specify { expect { subject.request_id }.not_to raise_error }
  end

  describe "#add_middleware" do
    let(:middleware) { double }

    specify { expect { subject.add_middleware(middleware) }.to change { subject.middlewares }.from([]).to([middleware]) }
  end

  describe "#connection" do
    context "when @connection set" do
      let(:connection) { double }

      before { subject.instance_variable_set(:@connection, connection) }

      specify { expect(subject.connection).to eq(connection) }
    end

    context "when @connection not set" do
      let(:user_agent) { double }

      let(:_read_timeout) { double }

      let(:_open_timeout) { double }

      let(:_write_timeout) { double }

      let(:adapter) { Faraday.default_adapter }

      before { expect(subject).to receive(:user_agent).and_return(user_agent) }

      before { expect(subject).to receive(:_read_timeout).and_return(_read_timeout) }

      before { expect(subject).to receive(:_open_timeout).and_return(_open_timeout) }

      before { expect(subject).to receive(:_write_timeout).and_return(_write_timeout) }

      before { expect(subject).to receive(:adapter).and_return(adapter) }

      specify { expect(subject.connection.headers["User-Agent"]).to eq(user_agent) }

      specify { expect(subject.connection.headers["Accept"]).to eq("application/json") }

      specify { expect(subject.connection.options.read_timeout).to eq(_read_timeout) }

      specify { expect(subject.connection.options.open_timeout).to eq(_open_timeout) }

      specify { expect(subject.connection.options.write_timeout).to eq(_write_timeout) }

      specify { expect(subject.connection.builder.handlers).to include(EveOnline::ESI::FaradayMiddlewares::RaiseErrors) }

      specify { expect(subject.connection.adapter).to eq(Faraday::Adapter::NetHttp) }

      context "when token is present" do
        let(:token) { "token123" }

        before { expect(subject).to receive(:token).and_return(token).twice }

        specify { expect(subject.connection.builder.app.instance_variable_get(:@params)).to eq([token]) }

        specify { expect(subject.connection.builder.app.instance_variable_get(:@type)).to eq("Bearer") }
      end

      context "when token is empty" do
        before { expect(subject).to receive(:token).and_return(nil) }

        specify { expect(subject.connection.builder.app.instance_variable_get(:@params)).to eq(nil) }

        specify { expect(subject.connection.builder.app.instance_variable_get(:@type)).to eq(nil) }
      end

      context "with middlewares" do
        let(:klass) { Class.new }

        let(:middleware) { {class: klass} }

        before { subject.add_middleware(middleware) }

        specify { expect(subject.connection.builder.handlers).to include(klass) }
      end
    end
  end

  describe "#uri" do
    context "when @uri set" do
      let(:uri) { double }

      before { subject.instance_variable_set(:@uri, uri) }

      specify { expect(subject.uri).to eq(uri) }
    end

    context "when @uri not set" do
      let(:uri) { double }

      let(:path) { double }

      before { expect(subject).to receive(:path).and_return(path) }

      context "when query is presence" do
        let(:query) { double }

        let(:to_query) { double }

        before { expect(subject).to receive(:query).and_return(query).twice }

        before { expect(query).to receive(:to_query).and_return(to_query) }

        before do
          #
          # URI::HTTPS.build(host: API_HOST,
          #                  path: path,
          #                  query: query.to_query) # => uri
          #
          expect(URI::HTTPS).to receive(:build)
            .with({
              host: described_class::API_HOST,
              path: path,
              query: to_query
            })
            .and_return(uri)
        end

        specify { expect { subject.uri }.to change { subject.instance_variable_get(:@uri) }.from(nil).to(uri) }
      end

      context "when query is not presence" do
        before { expect(subject).to receive(:query).and_return({}) }

        before do
          #
          # URI::HTTPS.build(host: API_HOST, path: path) # => uri
          #
          expect(URI::HTTPS).to receive(:build)
            .with({
              host: described_class::API_HOST,
              path: path
            })
            .and_return(uri)
        end

        specify { expect { subject.uri }.to change { subject.instance_variable_get(:@uri) }.from(nil).to(uri) }
      end
    end
  end

  describe "#additional_query_params" do
    specify { expect(subject.additional_query_params).to eq([]) }
  end

  describe "#base_query_params" do
    specify { expect(subject.base_query_params).to eq([]) }
  end

  describe "#path" do
    specify { expect { subject.path }.to raise_error(NotImplementedError) }
  end

  describe "#query" do
    context "when all params is blank" do
      let(:options) { {language: nil} }

      subject { described_class.new(options) }

      before { expect(subject).to receive(:additional_query_params).and_return([:language]) }

      specify { expect(subject.query).to eq({}) }
    end

    context "when all params is present" do
      let(:options) { {language: "de"} }

      subject { described_class.new(options) }

      before { expect(subject).to receive(:additional_query_params).and_return([:language]) }

      specify { expect(subject.query).to eq(language: "de") }
    end
  end

  describe "#resource" do
    context "when @resource set" do
      let(:resource) { double }

      before { subject.instance_variable_set(:@resource, resource) }

      specify { expect(subject.resource).to eq(resource) }
    end

    context "when @resource not set" do
      let(:resource) { double }

      let(:http_method) { double }

      let(:uri) { double }

      let(:connection) { double }

      before { expect(subject).to receive(:http_method).and_return(http_method) }

      before { expect(subject).to receive(:uri).and_return(uri) }

      before { expect(subject).to receive(:connection).and_return(connection) }

      before { expect(connection).to receive(:public_send).with(http_method, uri).and_return(resource) }

      specify { expect(subject.resource).to eq(resource) }

      specify { expect { subject.resource }.to change { subject.instance_variable_get(:@resource) }.from(nil).to(resource) }
    end

    context "when throw Faraday::ConnectionFailed" do
      let(:http_method) { double }

      let(:uri) { double }

      let(:connection) { double }

      before { expect(subject).to receive(:http_method).and_return(http_method) }

      before { expect(subject).to receive(:uri).and_return(uri) }

      before { expect(subject).to receive(:connection).and_return(connection) }

      before { expect(connection).to receive(:public_send).with(http_method, uri).and_raise(Faraday::ConnectionFailed, nil) }

      specify { expect { subject.resource }.to raise_error(EveOnline::Exceptions::Timeout) }
    end

    context "when throw Faraday::TimeoutError" do
      let(:http_method) { double }

      let(:uri) { double }

      let(:connection) { double }

      before { expect(subject).to receive(:http_method).and_return(http_method) }

      before { expect(subject).to receive(:uri).and_return(uri) }

      before { expect(subject).to receive(:connection).and_return(connection) }

      before { expect(connection).to receive(:public_send).with(http_method, uri).and_raise(Faraday::TimeoutError, nil) }

      specify { expect { subject.resource }.to raise_error(EveOnline::Exceptions::Timeout) }
    end
  end

  describe "#response" do
    context "when @response set" do
      let(:response) { double }

      before { subject.instance_variable_set(:@response, response) }

      specify { expect(subject.response).to eq(response) }
    end

    context "when @response not set" do
      let(:body) { double }

      let(:resource) { double(body: body) }

      before { expect(subject).to receive(:resource).and_return(resource) }

      specify { expect { subject.response }.not_to raise_error }

      specify { expect { subject.response }.to change { subject.instance_variable_get(:@response) }.from(nil).to(body) }
    end
  end

  # private methods

  describe "#parse_datetime_with_timezone" do
    let(:value) { double }

    before do
      #
      # ActiveSupport::TimeZone["UTC"].parse(value)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with("UTC") do
        double.tap do |a|
          expect(a).to receive(:parse).with(value)
        end
      end
    end

    specify { expect { subject.send(:parse_datetime_with_timezone, value) }.not_to raise_error }
  end
end
