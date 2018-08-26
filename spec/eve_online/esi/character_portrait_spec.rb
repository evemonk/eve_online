# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::CharacterPortrait do
  let(:options) { { character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v2/characters/%<character_id>s/portrait/?datasource=%<datasource>s') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:datasource) { should eq('tranquility') }

    its(:character_id) { should eq(12_345_678) }
  end

  describe '#model' do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    let(:model) { double }

    before do
      #
      # EveOnline::ESI::Models::CharacterPortrait.new(response) # => model
      #
      expect(EveOnline::ESI::Models::CharacterPortrait).to receive(:new).with(response).and_return(model)
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

  describe '#medium' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:medium) }

    specify { expect { subject.medium }.not_to raise_error }
  end

  describe '#large' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:large) }

    specify { expect { subject.large }.not_to raise_error }
  end

  describe '#huge' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:huge) }

    specify { expect { subject.huge }.not_to raise_error }
  end

  describe '#small' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:small) }

    specify { expect { subject.small }.not_to raise_error }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v2/characters/12345678/portrait/?datasource=tranquility')
    end
  end
end
