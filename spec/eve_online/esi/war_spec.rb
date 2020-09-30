# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::War do
  let(:options) { {id: 615_578} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/wars/%<war_id>s/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:id) { should eq(615_578) }
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::War) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::War) }

      before do
        #
        # EveOnline::ESI::Models::War.new(response) # => model
        #
        expect(EveOnline::ESI::Models::War).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::War) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#declared" do
    let(:model) { instance_double(EveOnline::ESI::Models::War) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:declared) }

    specify { expect { subject.declared }.not_to raise_error }
  end

  describe "#finished" do
    let(:model) { instance_double(EveOnline::ESI::Models::War) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:finished) }

    specify { expect { subject.finished }.not_to raise_error }
  end

  describe "#war_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::War) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:war_id) }

    specify { expect { subject.war_id }.not_to raise_error }
  end

  describe "#mutual" do
    let(:model) { instance_double(EveOnline::ESI::Models::War) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:mutual) }

    specify { expect { subject.mutual }.not_to raise_error }
  end

  describe "#open_for_allies" do
    let(:model) { instance_double(EveOnline::ESI::Models::War) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:open_for_allies) }

    specify { expect { subject.open_for_allies }.not_to raise_error }
  end

  describe "#retracted" do
    let(:model) { instance_double(EveOnline::ESI::Models::War) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:retracted) }

    specify { expect { subject.retracted }.not_to raise_error }
  end

  describe "#started" do
    let(:model) { instance_double(EveOnline::ESI::Models::War) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:started) }

    specify { expect { subject.started }.not_to raise_error }
  end

  describe "#aggressor" do
    let(:model) { instance_double(EveOnline::ESI::Models::War) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:aggressor) }

    specify { expect { subject.aggressor }.not_to raise_error }
  end

  describe "#allies" do
    let(:model) { instance_double(EveOnline::ESI::Models::War) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:allies) }

    specify { expect { subject.allies }.not_to raise_error }
  end

  describe "#defender" do
    let(:model) { instance_double(EveOnline::ESI::Models::War) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:defender) }

    specify { expect { subject.defender }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/wars/615578/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/wars/615578/")
    end
  end
end
