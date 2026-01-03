# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Wars do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/wars/") }

  describe "#initialize" do
    context "without options" do
      its(:token) { should eq(nil) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      its(:_write_timeout) { should eq(60) }

      its(:max_war_id) { should eq(nil) }
    end

    context "with options" do
      let(:options) { {max_war_id: 123} }

      subject { described_class.new(options) }

      its(:max_war_id) { should eq(123) }
    end
  end

  describe "#war_ids" do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    specify { expect(subject.war_ids).to eq(response) }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#additional_query_params" do
    specify { expect(subject.additional_query_params).to eq([:max_war_id]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/wars/")
    end
  end

  describe "#query" do
    context "without max_war_id" do
      specify do
        expect(subject.query).to eq({})
      end
    end

    context "with max_war_id" do
      let(:options) { {max_war_id: 123} }

      subject { described_class.new(options) }

      specify do
        expect(subject.query).to eq(max_war_id: 123)
      end
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/wars/")
    end
  end
end
