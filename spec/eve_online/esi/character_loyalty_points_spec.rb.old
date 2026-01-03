# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterLoyaltyPoints do
  let(:options) { {token: "token123", character_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/characters/%<character_id>s/loyalty/points/") }

  describe "#initialize" do
    its(:token) { should eq("token123") }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe "#loyalty_points" do
    context "when @loyalty_points set" do
      let(:loyalty_points) { [instance_double(EveOnline::ESI::Models::LoyaltyPoint)] }

      before { subject.instance_variable_set(:@loyalty_points, loyalty_points) }

      specify { expect(subject.loyalty_points).to eq(loyalty_points) }
    end

    context "when @loyalty_points not set" do
      let(:loyalty_point) { instance_double(EveOnline::ESI::Models::LoyaltyPoint) }

      let(:response) do
        [
          {
            corporation_id: 1_000_035,
            loyalty_points: 14_163
          }
        ]
      end

      before do
        #
        # subject.response # => [{"corporation_id"=>1000035, "loyalty_points"=>14163}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::LoyaltyPoint.new(response.first) # => loyalty_point
        #
        expect(EveOnline::ESI::Models::LoyaltyPoint).to receive(:new).with(response.first).and_return(loyalty_point)
      end

      specify { expect(subject.loyalty_points).to eq([loyalty_point]) }

      specify { expect { subject.loyalty_points }.to change { subject.instance_variable_get(:@loyalty_points) }.from(nil).to([loyalty_point]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-characters.read_loyalty.v1") }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/characters/12345678/loyalty/points/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/characters/12345678/loyalty/points/")
    end
  end
end
