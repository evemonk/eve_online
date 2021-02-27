# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::MarketGroup do
  let(:options) { {id: 618} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/markets/groups/%<market_group_id>s/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:id) { should eq(618) }
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::MarketGroup) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::MarketGroup) }

      before do
        #
        # EveOnline::ESI::Models::MarketGroup.new(response) # => model
        #
        expect(EveOnline::ESI::Models::MarketGroup).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::MarketGroup) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#description" do
    let(:model) { instance_double(EveOnline::ESI::Models::MarketGroup) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:description) }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe "#market_group_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::MarketGroup) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:market_group_id) }

    specify { expect { subject.market_group_id }.not_to raise_error }
  end

  describe "#name" do
    let(:model) { instance_double(EveOnline::ESI::Models::MarketGroup) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:name) }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#parent_group_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::MarketGroup) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:parent_group_id) }

    specify { expect { subject.parent_group_id }.not_to raise_error }
  end

  describe "#type_ids" do
    let(:model) { instance_double(EveOnline::ESI::Models::MarketGroup) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:type_ids) }

    specify { expect { subject.type_ids }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#additional_query_params" do
    specify { expect(subject.additional_query_params).to eq([:language]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/markets/groups/618/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq(language: "en-us")
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/markets/groups/618/?language=en-us")
    end
  end
end
