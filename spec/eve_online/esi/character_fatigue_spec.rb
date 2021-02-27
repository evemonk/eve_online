# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterFatigue do
  let(:options) { {token: "token123", character_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/characters/%<character_id>s/fatigue/") }

  describe "#initialize" do
    its(:token) { should eq("token123") }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe "#model" do
    context "when @model set" do
      # TODO: rename Fatigue to CharacterFatigue
      let(:model) { instance_double(EveOnline::ESI::Models::Fatigue) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::Fatigue) }

      before do
        #
        # EveOnline::ESI::Models::Fatigue.new(response) # => model
        #
        expect(EveOnline::ESI::Models::Fatigue).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::Fatigue) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#jump_fatigue_expire_date" do
    let(:model) { instance_double(EveOnline::ESI::Models::Fatigue) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:jump_fatigue_expire_date) }

    specify { expect { subject.jump_fatigue_expire_date }.not_to raise_error }
  end

  describe "#last_jump_date" do
    let(:model) { instance_double(EveOnline::ESI::Models::Fatigue) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:last_jump_date) }

    specify { expect { subject.last_jump_date }.not_to raise_error }
  end

  describe "#last_update_date" do
    let(:model) { instance_double(EveOnline::ESI::Models::Fatigue) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:last_update_date) }

    specify { expect { subject.last_update_date }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-characters.read_fatigue.v1") }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/characters/12345678/fatigue/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/characters/12345678/fatigue/")
    end
  end
end
