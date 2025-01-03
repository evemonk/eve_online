# frozen_string_literal: true

require "spec_helper"

describe "Get bloodlines" do
  before { VCR.insert_cassette "esi/universe/bloodlines" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::UniverseBloodlines.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.bloodlines.size).to eq(18) }

  specify do
    expect(subject.bloodlines.first.as_json).to eq(id: 5,
      charisma: 3,
      corporation_id: 1_000_066,
      description: "True Amarrians are proud and supercilious, with a great sense of tradition and ancestry. They are considered arrogant and tyrannical by most others. The Empire's defeat at the hands of the mysterious Jovians, and the Minmatar uprising that followed, left an indelible mark on Amarrian culture. This double failure, a turning point in their history, has shaped an entire generation of policy and philosophy among the imperial elite.",
      intelligence: 7,
      memory: 6,
      name: "Amarr",
      perception: 4,
      race_id: 4,
      ship_type_id: 596,
      willpower: 10)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(16) }
end
