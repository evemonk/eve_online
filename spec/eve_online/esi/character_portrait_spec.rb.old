# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterPortrait do
  let(:options) { {character_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v2/characters/%<character_id>s/portrait/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::CharacterPortrait) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::CharacterPortrait) }

      before do
        #
        # EveOnline::ESI::Models::CharacterPortrait.new(response) # => model
        #
        expect(EveOnline::ESI::Models::CharacterPortrait).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::CharacterPortrait) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#medium" do
    let(:model) { instance_double(EveOnline::ESI::Models::CharacterPortrait) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:medium) }

    specify { expect { subject.medium }.not_to raise_error }
  end

  describe "#large" do
    let(:model) { instance_double(EveOnline::ESI::Models::CharacterPortrait) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:large) }

    specify { expect { subject.large }.not_to raise_error }
  end

  describe "#huge" do
    let(:model) { instance_double(EveOnline::ESI::Models::CharacterPortrait) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:huge) }

    specify { expect { subject.huge }.not_to raise_error }
  end

  describe "#small" do
    let(:model) { instance_double(EveOnline::ESI::Models::CharacterPortrait) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:small) }

    specify { expect { subject.small }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v2/characters/12345678/portrait/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v2/characters/12345678/portrait/")
    end
  end
end
