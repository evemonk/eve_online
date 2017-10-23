require 'spec_helper'

describe EveOnline::ESI::CharacterAttributes do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v1/characters/%s/attributes/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq('token123') }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(12_345_678) }
  end

  # def_delegators :model, :as_json, :charisma, :intelligence, :memory,
  #                :perception, :willpower, :bonus_remaps,
  #                :last_remap_date, :accrued_remap_cooldown_date
  #
  # def model
  #   @model ||= Models::Attributes.new(response)
  # end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-skills.read_skills.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v1/characters/12345678/attributes/?datasource=tranquility')
    end
  end
end
