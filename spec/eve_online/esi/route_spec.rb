# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Route do

  let(:options) do
    { origin: 30000142, destination: 30002187 }
  end

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v2/route/%<origin>s/%<destination>s") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:origin) { should eq(30000142) }

    its(:destination) { should eq(30002187) }
  end

  describe "#route" do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    specify { expect(subject.route).to eq(response) }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#additional_query_params" do
    specify { expect(subject.additional_query_params).to eq([:avoid, :connections, :flag]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v2/route/30000142/30002187")
    end
  end
end
