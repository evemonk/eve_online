# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::UniverseBloodlines do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/universe/bloodlines/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }
  end

  describe "#bloodlines" do
    context "when @bloodlines set" do
      let(:bloodlines) { [instance_double(EveOnline::ESI::Models::Bloodline)] }

      before { subject.instance_variable_set(:@bloodlines, bloodlines) }

      specify { expect(subject.bloodlines).to eq(bloodlines) }
    end

    context "when @bloodlines not set" do
      let(:bloodline) { instance_double(EveOnline::ESI::Models::Bloodline) }

      let(:response) do
        [
          {
            bloodline_id: 4,
            name: "Brutor",
            description: "A martial, strong-willed people, the Brutor...",
            race_id: 2,
            ship_type_id: 588,
            corporation_id: 1_000_049,
            perception: 9,
            willpower: 7,
            charisma: 6,
            memory: 4,
            intelligence: 4
          }
        ]
      end

      before do
        #
        # subject.response # => [{"bloodline_id"=>4, "name"=>"Brutor", "description"=>"A martial, strong-willed people, the Brutor...", "race_id"=>2, "ship_type_id"=>588, "corporation_id"=>1000049, "perception"=>9, "willpower"=>7, "charisma"=>6, "memory"=>4, "intelligence"=>4}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::Bloodline.new(response.first) # => bloodline
        #
        expect(EveOnline::ESI::Models::Bloodline).to receive(:new).with(response.first).and_return(bloodline)
      end

      specify { expect(subject.bloodlines).to eq([bloodline]) }

      specify { expect { subject.bloodlines }.to change { subject.instance_variable_get(:@bloodlines) }.from(nil).to([bloodline]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#additional_query_params" do
    specify { expect(subject.additional_query_params).to eq([:language]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/universe/bloodlines/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq(language: "en-us")
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/universe/bloodlines/?language=en-us")
    end
  end
end
