# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterSendEmail do
  let(:options) { {token: "token123"} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/characters/%<character_id>/mail/") }

  describe "#initialize" do
    its(:token) { should eq("token123") }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-mail.send_mail.v1") }
  end
end
