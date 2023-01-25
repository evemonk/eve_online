# frozen_string_literal: true

require "spec_helper"

describe "Get type information" do
  before { VCR.insert_cassette "esi/universe/types/192" }

  after { VCR.eject_cassette }

  let(:options) { {id: 192, language: "en-us"} }

  subject { EveOnline::ESI::UniverseType.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(capacity: 0.0,
      description: "Medium Projectile Ammo. This ammo uses a similar plasma containment core as hybrid charges except that it is mounted in a standard cannon shell.\r\n\r\n50% reduced optimal range.",
      graphic_id: 1297,
      group_id: 83,
      icon_id: 1297,
      market_group_id: 112,
      mass: 1.0,
      name: "Phased Plasma M",
      packaged_volume: 0.0125,
      portion_size: 100,
      published: true,
      radius: 1.0,
      type_id: 192,
      volume: 0.0125)
  end

  specify { expect(subject.dogma_attributes.size).to eq(17) }

  specify { expect(subject.dogma_attributes.first.as_json).to eq(attribute_id: 128, value: 2.0) }

  specify { expect(subject.dogma_effects.size).to eq(3) }

  specify { expect(subject.dogma_effects.first.as_json).to eq(effect_id: 596, is_default: false) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(30) }
end
