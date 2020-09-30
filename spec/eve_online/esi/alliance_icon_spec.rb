# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::AllianceIcon do
  let(:options) { {alliance_id: 99_005_443} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/alliances/%<alliance_id>s/icons/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:alliance_id) { should eq(99_005_443) }
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::AllianceIcon) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::AllianceIcon) }

      before do
        #
        # EveOnline::ESI::Models::AllianceIcon.new(response) # => model
        #
        expect(EveOnline::ESI::Models::AllianceIcon).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::AllianceIcon) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#icon_small" do
    let(:model) { instance_double(EveOnline::ESI::Models::AllianceIcon) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:icon_small) }

    specify { expect { subject.icon_small }.not_to raise_error }
  end

  describe "#icon_medium" do
    let(:model) { instance_double(EveOnline::ESI::Models::AllianceIcon) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:icon_medium) }

    specify { expect { subject.icon_medium }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/alliances/99005443/icons/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/alliances/99005443/icons/")
    end
  end
end
