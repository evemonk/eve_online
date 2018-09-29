# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::DogmaEffect do
  let(:options) { { id: 596 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v2/dogma/effects/%<effect_id>s/?datasource=%<datasource>s') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:datasource) { should eq('tranquility') }

    its(:id) { should eq(596) }
  end

  describe '#model' do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before do
      #
      # EveOnline::ESI::Models::DogmaEffect.new(response) # => model
      #
      expect(EveOnline::ESI::Models::DogmaEffect).to receive(:new).with(response).and_return(model)
    end

    specify { expect { subject.model }.not_to raise_error }

    specify { expect { subject.model }.to change { subject.instance_variable_defined?(:@_memoized_model) }.from(false).to(true) }
  end

  describe '#as_json' do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe '#description' do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:description) }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe '#disallow_auto_repeat' do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:disallow_auto_repeat) }

    specify { expect { subject.disallow_auto_repeat }.not_to raise_error }
  end

  
  
  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v2/dogma/effects/596/?datasource=tranquility')
    end
  end
end
