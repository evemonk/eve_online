# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterOnline do
  let(:options) { {token: "token123", character_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v3/characters/%<character_id>s/online/") }

  describe "#initialize" do
    its(:token) { should eq("token123") }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe "#model" do
    context "when @model set" do
      # TODO: rename Online to CharacterOnline?
      let(:model) { instance_double(EveOnline::ESI::Models::Online) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::Online) }

      before do
        #
        # EveOnline::ESI::Models::Online.new(response) # => model
        #
        expect(EveOnline::ESI::Models::Online).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::Online) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#last_login" do
    let(:model) { instance_double(EveOnline::ESI::Models::Online) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:last_login) }

    specify { expect { subject.last_login }.not_to raise_error }
  end

  describe "#last_logout" do
    let(:model) { instance_double(EveOnline::ESI::Models::Online) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:last_logout) }

    specify { expect { subject.last_logout }.not_to raise_error }
  end

  describe "#logins" do
    let(:model) { instance_double(EveOnline::ESI::Models::Online) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:logins) }

    specify { expect { subject.logins }.not_to raise_error }
  end

  describe "#online" do
    let(:model) { instance_double(EveOnline::ESI::Models::Online) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:online) }

    specify { expect { subject.online }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-location.read_online.v1") }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v3/characters/12345678/online/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v3/characters/12345678/online/")
    end
  end
end
