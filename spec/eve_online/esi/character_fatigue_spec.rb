require 'spec_helper'

describe EveOnline::ESI::CharacterFatigue do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v1/characters/%<character_id>s/fatigue/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq('token123') }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe '#model' do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    let(:model) { double }

    before do
      #
      # EveOnline::ESI::Models::Fatigue.new(response) # => model
      #
      expect(EveOnline::ESI::Models::Fatigue).to receive(:new).with(response).and_return(model)
    end

    specify { expect { subject.model }.not_to raise_error }

    specify { expect { subject.model }.to change { subject.instance_variable_defined?(:@_memoized_model) }.from(false).to(true) }
  end

  describe '#as_json' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe '#jump_fatigue_expire_date' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:jump_fatigue_expire_date) }

    specify { expect { subject.jump_fatigue_expire_date }.not_to raise_error }
  end

  describe '#last_jump_date' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:last_jump_date) }

    specify { expect { subject.last_jump_date }.not_to raise_error }
  end

  describe '#last_update_date' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:last_update_date) }

    specify { expect { subject.last_update_date }.not_to raise_error }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-characters.read_fatigue.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v1/characters/12345678/fatigue/?datasource=tranquility')
    end
  end
end
