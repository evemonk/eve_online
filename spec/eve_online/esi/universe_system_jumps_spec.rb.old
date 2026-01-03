# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::UniverseSystemJumps do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/universe/system_jumps/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }
  end

  describe "#system_jumps" do
    context "when @system_jumps set" do
      let(:system_jumps) { [instance_double(EveOnline::ESI::Models::SystemJump)] }

      before { subject.instance_variable_set(:@system_jumps, system_jumps) }

      specify { expect(subject.system_jumps).to eq(system_jumps) }
    end

    context "when @system_jumps not set" do
      let(:system_jump) { instance_double(EveOnline::ESI::Models::SystemJump) }

      let(:response) do
        [
          {
            ship_jumps: 22,
            system_id: 30_005_327
          }
        ]
      end

      before do
        #
        # subject.response # => [{"ship_jumps"=>22, "system_id"=>30005327}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::SystemJump.new(response.first) # => system_jump
        #
        expect(EveOnline::ESI::Models::SystemJump).to receive(:new).with(response.first).and_return(system_jump)
      end

      specify { expect(subject.system_jumps).to eq([system_jump]) }

      specify { expect { subject.system_jumps }.to change { subject.instance_variable_get(:@system_jumps) }.from(nil).to([system_jump]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/universe/system_jumps/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/universe/system_jumps/")
    end
  end
end
