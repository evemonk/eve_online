# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterClones do
  let(:options) { {token: "token123", character_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v3/characters/%<character_id>s/clones/") }

  describe "#initialize" do
    its(:token) { should eq("token123") }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe "#home_location" do
    context "when @home_location set" do
      let(:home_location) { [instance_double(EveOnline::ESI::Models::HomeLocation)] }

      before { subject.instance_variable_set(:@home_location, home_location) }

      specify { expect(subject.home_location).to eq(home_location) }
    end

    context "when @home_location not set" do
      let(:model) { instance_double(EveOnline::ESI::Models::HomeLocation) }

      let(:home_location) { double }

      before do
        #
        # subject.response['home_location'] => home_location
        #
        expect(subject).to receive(:response) do
          double.tap do |a|
            expect(a).to receive(:[]).with("home_location").and_return(home_location)
          end
        end
      end

      before do
        #
        # EveOnline::ESI::Models::HomeLocation.new(home_location) # => model
        #
        expect(EveOnline::ESI::Models::HomeLocation).to receive(:new).with(home_location).and_return(model)
      end

      specify { expect { subject.home_location }.not_to raise_error }

      specify { expect { subject.home_location }.to change { subject.instance_variable_get(:@home_location) }.from(nil).to(model) }
    end
  end

  describe "#jump_clones" do
    context "when @jump_clones set" do
      let(:jump_clones) { [instance_double(EveOnline::ESI::Models::JumpClone)] }

      before { subject.instance_variable_set(:@jump_clones, jump_clones) }

      specify { expect(subject.jump_clones).to eq(jump_clones) }
    end

    context "when @jump_clones not set" do
      let(:jump_clone) { instance_double(EveOnline::ESI::Models::JumpClone) }

      let(:response) do
        [
          {
            location_id: 61_000_032,
            location_type: "station",
            implants: [22_118]
          }
        ]
      end

      before do
        #
        # subject.response['jump_clones'] # => [{"location_id"=>61000032, "location_type"=>"station", "implants"=>[22118]}]
        #
        expect(subject).to receive(:response) do
          double.tap do |a|
            expect(a).to receive(:[]).with("jump_clones").and_return(response)
          end
        end
      end

      before do
        #
        # EveOnline::ESI::Models::JumpClone.new(response.first) # => jump_clone
        #
        expect(EveOnline::ESI::Models::JumpClone).to receive(:new).with(response.first).and_return(jump_clone)
      end

      specify { expect(subject.jump_clones).to eq([jump_clone]) }

      specify { expect { subject.jump_clones }.to change { subject.instance_variable_get(:@jump_clones) }.from(nil).to([jump_clone]) }
    end
  end

  describe "#last_clone_jump_date" do
    context "when last_clone_jump_date is present" do
      let(:last_clone_jump_date) { double }

      before do
        #
        # subject.response['last_clone_jump_date'] => last_clone_jump_date
        #
        expect(subject).to receive(:response) do
          double.tap do |a|
            expect(a).to receive(:[]).with("last_clone_jump_date").and_return(last_clone_jump_date)
          end
        end
      end

      before do
        #
        # subject.parse_datetime_with_timezone(last_clone_jump_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(last_clone_jump_date)
      end

      specify { expect { subject.last_clone_jump_date }.not_to raise_error }
    end

    context "when last_clone_jump_date not present" do
      before do
        #
        # subject.response['last_clone_jump_date'] => nil
        #
        expect(subject).to receive(:response) do
          double.tap do |a|
            expect(a).to receive(:[]).with("last_clone_jump_date").and_return(nil)
          end
        end
      end

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.last_clone_jump_date }.not_to raise_error }
    end
  end

  describe "#last_station_change_date" do
    context "when last_station_change_date is present" do
      let(:last_station_change_date) { double }

      before do
        #
        # subject.response['last_station_change_date'] => last_station_change_date
        #
        expect(subject).to receive(:response) do
          double.tap do |a|
            expect(a).to receive(:[]).with("last_station_change_date").and_return(last_station_change_date)
          end
        end
      end

      before do
        #
        # subject.parse_datetime_with_timezone(last_station_change_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(last_station_change_date)
      end

      specify { expect { subject.last_station_change_date }.not_to raise_error }
    end

    context "when last_station_change_date not present" do
      before do
        #
        # subject.response['last_station_change_date'] => nil
        #
        expect(subject).to receive(:response) do
          double.tap do |a|
            expect(a).to receive(:[]).with("last_station_change_date").and_return(nil)
          end
        end
      end

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.last_station_change_date }.not_to raise_error }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-clones.read_clones.v1") }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v3/characters/12345678/clones/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v3/characters/12345678/clones/")
    end
  end
end
