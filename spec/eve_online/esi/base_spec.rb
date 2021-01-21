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
          etag: "6f2d3caa79a79bc9e61aa058e18905faac5e293fa1729637648ce9a1",
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

      its(:_etag) { should eq("6f2d3caa79a79bc9e61aa058e18905faac5e293fa1729637648ce9a1") }

      its(:language) { should eq("ru") }

      its(:adapter) { should eq(adapter) }

      its(:middlewares) { should eq(middlewares) }
    end

    context "without options" do
      its(:token) { should eq(nil) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      its(:_write_timeout) { should eq(60) }

      its(:_etag) { should eq(nil) }

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

  describe "#etag=" do
    specify { expect { subject.etag = "123abc" }.to change { subject._etag }.from(nil).to("123abc") }
  end

  describe "#etag" do
    let(:resource) { double }

    let(:headers) { double }

    let(:etag) { double }

    before { expect(subject).to receive(:resource).and_return(resource) }

    before { expect(resource).to receive(:headers).and_return(headers) }

    before { expect(headers).to receive(:[]).with("etag").and_return(etag) }

    before { expect(etag).to receive(:gsub).with("W/", "").and_return(etag) }

    before { expect(etag).to receive(:gsub).with('"', "") }

    specify { expect { subject.etag }.not_to raise_error }
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

  # describe "#connection" do
  #   # TODO: write
  # end
  #
  # describe "#client" do
  #   # context "when @client set" do
  #   #   let(:client) { double }
  #   #
  #   #   before { subject.instance_variable_set(:@client, client) }
  #   #
  #   #   specify { expect(subject.client).to eq(client) }
  #   # end
  #
  #   # context "when @client not set" do
  #   #   let(:host) { double }
  #   #
  #   #   let(:port) { double }
  #   #
  #   #   let(:uri) { double(host: host, port: port) }
  #   #
  #   #   let(:http) { instance_double(Net::HTTP) }
  #   #
  #   #   let(:_read_timeout) { double }
  #   #
  #   #   let(:_open_timeout) { double }
  #   #
  #   #   let(:_write_timeout) { double }
  #   #
  #   #   before { expect(subject).to receive(:uri).and_return(uri).twice }
  #   #
  #   #   before { expect(Net::HTTP).to receive(:new).with(host, port).and_return(http) }
  #   #
  #   #   before { expect(subject).to receive(:_read_timeout).and_return(_read_timeout) }
  #   #
  #   #   before { expect(subject).to receive(:_open_timeout).and_return(_open_timeout) }
  #   #
  #   #   before { expect(subject).to receive(:_write_timeout).and_return(_write_timeout) }
  #   #
  #   #   before { expect(http).to receive(:read_timeout=).with(_read_timeout) }
  #   #
  #   #   before { expect(http).to receive(:open_timeout=).with(_open_timeout) }
  #   #
  #   #   before { expect(http).to receive(:write_timeout=).with(_write_timeout) }
  #   #
  #   #   before { expect(http).to receive(:use_ssl=).with(true) }
  #   #
  #   #   before { expect(http).to receive(:verify_mode=).with(OpenSSL::SSL::VERIFY_PEER) }
  #   #
  #   #   specify { expect { subject.client }.not_to raise_error }
  #   #
  #   #   specify { expect { subject.client }.to change { subject.instance_variable_get(:@client) }.from(nil).to(http) }
  #   # end
  # end
  #
  # # describe "#request" do
  # #   context "when @request set" do
  # #     let(:request) { double }
  # #
  # #     before { subject.instance_variable_set(:@request, request) }
  # #
  # #     specify { expect(subject.request).to eq(request) }
  # #   end
  # #
  # #   context "when @request not set" do
  # #     let(:request_uri) { double }
  # #
  # #     let(:uri) { double(request_uri: request_uri) }
  # #
  # #     let(:user_agent) { double }
  # #
  # #     before { expect(subject).to receive(:uri).and_return(uri) }
  # #
  # #     before { expect(subject).to receive(:user_agent).and_return(user_agent) }
  # #
  # #     before { expect(subject).to receive(:http_method).and_return(http_method).exactly(3).times }
  # #
  # #     before { expect(request).to receive(:[]=).with("User-Agent", user_agent).and_return(request) }
  # #
  # #     before { expect(request).to receive(:[]=).with("Accept", "application/json").and_return(request) }
  # #
  # #     context "when http method Get and without token and etag" do
  # #       let(:http_method) { "Get" }
  # #
  # #       let(:request) { instance_double(Net::HTTP::Get) }
  # #
  # #       before { expect(Net::HTTP::Get).to receive(:new).with(request_uri).and_return(request) }
  # #
  # #       before { expect(subject).to receive(:token).and_return(nil) }
  # #
  # #       before { expect(subject).to receive(:_etag).and_return(nil) }
  # #
  # #       specify { expect { subject.request }.not_to raise_error }
  # #
  # #       specify { expect { subject.request }.to change { subject.instance_variable_get(:@request) }.from(nil).to(request) }
  # #     end
  # #
  # #     context "when http method Get and with token and etag" do
  # #       let(:http_method) { "Get" }
  # #
  # #       let(:request) { instance_double(Net::HTTP::Get) }
  # #
  # #       before { expect(Net::HTTP::Get).to receive(:new).with(request_uri).and_return(request) }
  # #
  # #       let(:token) { "token123" }
  # #
  # #       let(:_etag) { "etag" }
  # #
  # #       before { expect(subject).to receive(:token).and_return(token).twice }
  # #
  # #       before { expect(subject).to receive(:_etag).and_return(_etag).twice }
  # #
  # #       before { expect(request).to receive(:[]=).with("Authorization", "Bearer token123").and_return(request) }
  # #
  # #       before { expect(request).to receive(:[]=).with("If-None-Match", "etag").and_return(request) }
  # #
  # #       specify { expect { subject.request }.not_to raise_error }
  # #
  # #       specify { expect { subject.request }.to change { subject.instance_variable_get(:@request) }.from(nil).to(request) }
  # #     end
  # #
  # #     context "when http method Post" do
  # #       let(:http_method) { "Post" }
  # #
  # #       let(:request) { instance_double(Net::HTTP::Post) }
  # #
  # #       before { expect(Net::HTTP::Post).to receive(:new).with(request_uri).and_return(request) }
  # #
  # #       let(:payload) { double }
  # #
  # #       before { expect(subject).to receive(:payload).and_return(payload) }
  # #
  # #       before { expect(request).to receive(:[]=).with("Content-Type", "application/json").and_return(request) }
  # #
  # #       before { expect(request).to receive(:body=).with(payload) }
  # #
  # #       specify { expect { subject.request }.not_to raise_error }
  # #
  # #       specify { expect { subject.request }.to change { subject.instance_variable_get(:@request) }.from(nil).to(request) }
  # #     end
  # #   end
  # # end
  #
  # describe "#uri" do
  #   context "when @uri set" do
  #     let(:uri) { double }
  #
  #     before { subject.instance_variable_set(:@uri, uri) }
  #
  #     specify { expect(subject.uri).to eq(uri) }
  #   end
  #
  #   context "when @uri not set" do
  #     let(:uri) { double }
  #
  #     let(:path) { double }
  #
  #     before { expect(subject).to receive(:path).and_return(path) }
  #
  #     context "when query is presence" do
  #       let(:query) { double }
  #
  #       let(:to_query) { double }
  #
  #       before { expect(subject).to receive(:query).and_return(query).twice }
  #
  #       before { expect(query).to receive(:to_query).and_return(to_query) }
  #
  #       before do
  #         #
  #         # URI::HTTPS.build(host: API_HOST,
  #         #                  path: path,
  #         #                  query: query.to_query) # => uri
  #         #
  #         expect(URI::HTTPS).to receive(:build).with(host: described_class::API_HOST,
  #                                                    path: path,
  #                                                    query: to_query).and_return(uri)
  #       end
  #
  #       specify { expect { subject.uri }.not_to raise_error }
  #
  #       specify { expect { subject.uri }.to change { subject.instance_variable_get(:@uri) }.from(nil).to(uri) }
  #     end
  #
  #     context "when query is not presence" do
  #       before { expect(subject).to receive(:query).and_return({}) }
  #
  #       before do
  #         #
  #         # URI::HTTPS.build(host: API_HOST, path: path) # => uri
  #         #
  #         expect(URI::HTTPS).to receive(:build).with(host: described_class::API_HOST,
  #                                                    path: path).and_return(uri)
  #       end
  #
  #       specify { expect { subject.uri }.not_to raise_error }
  #
  #       specify { expect { subject.uri }.to change { subject.instance_variable_get(:@uri) }.from(nil).to(uri) }
  #     end
  #   end
  # end
  #
  # describe "#additional_query_params" do
  #   specify { expect(subject.additional_query_params).to eq([]) }
  # end
  #
  # describe "#base_query_params" do
  #   specify { expect(subject.base_query_params).to eq([]) }
  # end
  #
  # describe "#path" do
  #   specify { expect { subject.path }.to raise_error(NotImplementedError) }
  # end
  #
  # describe "#query" do
  #   context "when all params is blank" do
  #     let(:options) { {language: nil} }
  #
  #     subject { described_class.new(options) }
  #
  #     before { expect(subject).to receive(:additional_query_params).and_return([:language]) }
  #
  #     specify { expect(subject.query).to eq({}) }
  #   end
  #
  #   context "when all params is present" do
  #     let(:options) { {language: "de"} }
  #
  #     subject { described_class.new(options) }
  #
  #     before { expect(subject).to receive(:additional_query_params).and_return([:language]) }
  #
  #     specify { expect(subject.query).to eq(language: "de") }
  #   end
  # end
  #
  # describe "#resource" do
  #   context "when @resource set" do
  #     let(:resource) { double }
  #
  #     before { subject.instance_variable_set(:@resource, resource) }
  #
  #     specify { expect(subject.resource).to eq(resource) }
  #   end
  #
  #   # context "when @resource not set" do
  #   #   let(:resource) { double }
  #   #
  #   #   let(:client) { double }
  #   #
  #   #   let(:request) { double }
  #   #
  #   #   before { expect(subject).to receive(:request).and_return(request) }
  #   #
  #   #   before { expect(subject).to receive(:client).and_return(client) }
  #   #
  #   #   before { expect(client).to receive(:request).with(request).and_return(resource) }
  #   #
  #   #   specify { expect { subject.resource }.not_to raise_error }
  #   #
  #   #   specify { expect { subject.resource }.to change { subject.instance_variable_get(:@resource) }.from(nil).to(resource) }
  #   # end
  #
  #   context "when throw Faraday::ConnectionFailed" do
  #     before { expect(subject).to receive(:connection).and_raise(Faraday::ConnectionFailed) }
  #
  #     specify { expect { subject.resource }.to raise_error(EveOnline::Exceptions::Timeout) }
  #   end
  #
  #   context "when Faraday::TimeoutError" do
  #     before { expect(subject).to receive(:connection).and_raise(Faraday::TimeoutError) }
  #
  #     specify { expect { subject.resource }.to raise_error(EveOnline::Exceptions::Timeout) }
  #   end
  #
  #   # context "when Net::HTTP throw Net::WriteTimeout" do
  #   #   before { expect(subject).to receive(:client).and_raise(Net::WriteTimeout) }
  #   #
  #   #   specify { expect { subject.resource }.to raise_error(EveOnline::Exceptions::Timeout) }
  #   # end
  # end
  #
  # describe "#not_modified?" do
  #   let(:resource) { double }
  #
  #   before { expect(subject).to receive(:resource).and_return(resource) }
  #
  #   before { expect(resource).to receive(:is_a?).with(Net::HTTPNotModified) }
  #
  #   specify { expect { subject.not_modified? }.not_to raise_error }
  # end
  #
  # describe "#content" do
  #   context "when resource is Net::HTTPOK" do
  #     let(:body) { double }
  #
  #     let(:resource) { instance_double(Net::HTTPOK, body: body) }
  #
  #     before { expect(subject).to receive(:resource).and_return(resource).twice }
  #
  #     before { expect(Net::HTTPOK).to receive(:===).with(resource).and_return(true) }
  #
  #     specify { expect(subject.content).to eq(body) }
  #
  #     specify { expect { subject.content }.not_to raise_error }
  #   end
  #
  #   context "when resource is Net::HTTPCreated" do
  #     let(:resource) { instance_double(Net::HTTPCreated) }
  #
  #     before { expect(subject).to receive(:resource).and_return(resource) }
  #
  #     before { expect(Net::HTTPCreated).to receive(:===).with(resource).and_return(true) }
  #
  #     specify { expect { subject.content }.to raise_error(NotImplementedError) }
  #   end
  #
  #   context "when resource is Net::HTTPNoContent" do
  #     let(:resource) { instance_double(Net::HTTPNoContent) }
  #
  #     before { expect(subject).to receive(:resource).and_return(resource) }
  #
  #     before { expect(Net::HTTPNoContent).to receive(:===).with(resource).and_return(true) }
  #
  #     specify { expect { subject.content }.to raise_error(EveOnline::Exceptions::NoContent) }
  #   end
  #
  #   context "when resource is Net::HTTPNotModified" do
  #     let(:resource) { instance_double(Net::HTTPNotModified) }
  #
  #     before { expect(subject).to receive(:resource).and_return(resource) }
  #
  #     before { expect(Net::HTTPNotModified).to receive(:===).with(resource).and_return(true) }
  #
  #     specify { expect { subject.content }.to raise_error(EveOnline::Exceptions::NotModified) }
  #   end
  #
  #   context "when resource is Net::HTTPBadRequest" do
  #     let(:resource) { instance_double(Net::HTTPBadRequest) }
  #
  #     before { expect(subject).to receive(:resource).and_return(resource) }
  #
  #     before { expect(Net::HTTPBadRequest).to receive(:===).with(resource).and_return(true) }
  #
  #     specify { expect { subject.content }.to raise_error(EveOnline::Exceptions::BadRequest) }
  #   end
  #
  #   context "when resource is Net::HTTPUnauthorized" do
  #     let(:resource) { instance_double(Net::HTTPUnauthorized) }
  #
  #     before { expect(subject).to receive(:resource).and_return(resource) }
  #
  #     before { expect(Net::HTTPUnauthorized).to receive(:===).with(resource).and_return(true) }
  #
  #     specify { expect { subject.content }.to raise_error(EveOnline::Exceptions::Unauthorized) }
  #   end
  #
  #   context "when resource is Net::HTTPForbidden" do
  #     let(:resource) { instance_double(Net::HTTPForbidden) }
  #
  #     before { expect(subject).to receive(:resource).and_return(resource) }
  #
  #     before { expect(Net::HTTPForbidden).to receive(:===).with(resource).and_return(true) }
  #
  #     specify { expect { subject.content }.to raise_error(EveOnline::Exceptions::Forbidden) }
  #   end
  #
  #   context "when resource is Net::HTTPNotFound" do
  #     let(:resource) { instance_double(Net::HTTPNotFound) }
  #
  #     before { expect(subject).to receive(:resource).and_return(resource) }
  #
  #     before { expect(Net::HTTPNotFound).to receive(:===).with(resource).and_return(true) }
  #
  #     specify { expect { subject.content }.to raise_error(EveOnline::Exceptions::ResourceNotFound) }
  #   end
  #
  #   context "when resource is Net::HTTPInternalServerError" do
  #     let(:resource) { instance_double(Net::HTTPInternalServerError) }
  #
  #     before { expect(subject).to receive(:resource).and_return(resource) }
  #
  #     before { expect(Net::HTTPInternalServerError).to receive(:===).with(resource).and_return(true) }
  #
  #     specify { expect { subject.content }.to raise_error(EveOnline::Exceptions::InternalServerError) }
  #   end
  #
  #   context "when resource is Net::HTTPBadGateway" do
  #     let(:resource) { instance_double(Net::HTTPBadGateway) }
  #
  #     before { expect(subject).to receive(:resource).and_return(resource) }
  #
  #     before { expect(Net::HTTPBadGateway).to receive(:===).with(resource).and_return(true) }
  #
  #     specify { expect { subject.content }.to raise_error(EveOnline::Exceptions::BadGateway) }
  #   end
  #
  #   context "when resource is Net::HTTPServiceUnavailable" do
  #     let(:resource) { instance_double(Net::HTTPServiceUnavailable) }
  #
  #     before { expect(subject).to receive(:resource).and_return(resource) }
  #
  #     before { expect(Net::HTTPServiceUnavailable).to receive(:===).with(resource).and_return(true) }
  #
  #     specify { expect { subject.content }.to raise_error(EveOnline::Exceptions::ServiceUnavailable) }
  #   end
  #
  #   context "when status not supported" do
  #     let(:resource) { double }
  #
  #     before { expect(subject).to receive(:resource).and_return(resource) }
  #
  #     specify { expect { subject.content }.to raise_error(NotImplementedError) }
  #   end
  # end
  #
  # describe "#response" do
  #   context "when @response set" do
  #     let(:response) { double }
  #
  #     before { subject.instance_variable_set(:@response, response) }
  #
  #     specify { expect(subject.response).to eq(response) }
  #   end
  #
  #   context "when @response not set" do
  #     let(:content) { "some content to parse" }
  #
  #     before { expect(subject).to receive(:content).and_return(content) }
  #
  #     specify { expect { subject.response }.not_to raise_error }
  #   end
  # end
  #
  # # private methods
  #
  # describe "#parse_datetime_with_timezone" do
  #   let(:value) { double }
  #
  #   before do
  #     #
  #     # ActiveSupport::TimeZone["UTC"].parse(value)
  #     #
  #     expect(ActiveSupport::TimeZone).to receive(:[]).with("UTC") do
  #       double.tap do |a|
  #         expect(a).to receive(:parse).with(value)
  #       end
  #     end
  #   end
  #
  #   specify { expect { subject.send(:parse_datetime_with_timezone, value) }.not_to raise_error }
  # end
end
