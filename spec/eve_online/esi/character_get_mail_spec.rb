# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterGetMail do
  let(:options) { {token: "token123", character_id: 12_345_678, mail_id: 321_123_123} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/characters/%<character_id>s/mail/%<mail_id>s/") }

  describe "#initialize" do
    its(:token) { should eq("token123") }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:character_id) { should eq(12_345_678) }

    its(:mail_id) { should eq(321_123_123) }
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::Mail) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::Mail) }

      before do
        #
        # EveOnline::ESI::Models::Mail.new(response) # => model
        #
        expect(EveOnline::ESI::Models::Mail).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::Mail) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#body" do
    let(:model) { instance_double(EveOnline::ESI::Models::Mail) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:body) }

    specify { expect { subject.body }.not_to raise_error }
  end

  describe "#from_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Mail) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:from_id) }

    specify { expect { subject.from_id }.not_to raise_error }
  end

  describe "#read" do
    let(:model) { instance_double(EveOnline::ESI::Models::Mail) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:read) }

    specify { expect { subject.read }.not_to raise_error }
  end

  describe "#subject" do
    let(:model) { instance_double(EveOnline::ESI::Models::Mail) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:subject) }

    specify { expect { subject.subject }.not_to raise_error }
  end

  describe "#timestamp" do
    let(:model) { instance_double(EveOnline::ESI::Models::Mail) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:timestamp) }

    specify { expect { subject.timestamp }.not_to raise_error }
  end

  describe "#label_ids" do
    let(:model) { instance_double(EveOnline::ESI::Models::Mail) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:label_ids) }

    specify { expect { subject.label_ids }.not_to raise_error }
  end

  describe "#recipients" do
    let(:model) { instance_double(EveOnline::ESI::Models::Mail) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:recipients) }

    specify { expect { subject.recipients }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-mail.read_mail.v1") }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/characters/12345678/mail/321123123/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/characters/12345678/mail/321123123/")
    end
  end
end
