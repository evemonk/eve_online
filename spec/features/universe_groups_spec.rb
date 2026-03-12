# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get item groups" do
  before { VCR.insert_cassette "esi/universe/groups" }

  after { VCR.eject_cassette }

  let(:options) { {page: 1} }

  subject { EveOnline::ESI::UniverseGroups.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.page).to eq(1) }

  specify { expect(subject.total_pages).to eq(2) }

  specify { expect(subject.group_ids.size).to eq(1000) }

  specify { expect(subject.group_ids.first).to eq(0) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(1) }
end
