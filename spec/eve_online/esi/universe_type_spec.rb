# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::UniverseType do
  let(:options) { { type_id: 192 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v3/universe/types/%<type_id>s/?datasource=%<datasource>s&language=en-us') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:datasource) { should eq('tranquility') }

    its(:type_id) { should eq(192) }
  end

  describe '#model' do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    let(:model) { double }

    before do
      #
      # EveOnline::ESI::Models::Type.new(response) # => model
      #
      expect(EveOnline::ESI::Models::Type).to receive(:new).with(response).and_return(model)
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

  describe '#name' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:name) }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe '#description' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:description) }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe '#published' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:published) }

    specify { expect { subject.published }.not_to raise_error }
  end

  describe '#group_id' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:group_id) }

    specify { expect { subject.group_id }.not_to raise_error }
  end

  describe '#market_group_id' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:market_group_id) }

    specify { expect { subject.market_group_id }.not_to raise_error }
  end

  describe '#radius' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:radius) }

    specify { expect { subject.radius }.not_to raise_error }
  end

  describe '#volume' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:volume) }

    specify { expect { subject.volume }.not_to raise_error }
  end

  describe '#packaged_volume' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:packaged_volume) }

    specify { expect { subject.packaged_volume }.not_to raise_error }
  end

  describe '#icon_id' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:icon_id) }

    specify { expect { subject.icon_id }.not_to raise_error }
  end

  describe '#capacity' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:capacity) }

    specify { expect { subject.capacity }.not_to raise_error }
  end

  describe '#portion_size' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:portion_size) }

    specify { expect { subject.portion_size }.not_to raise_error }
  end

  describe '#mass' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:mass) }

    specify { expect { subject.mass }.not_to raise_error }
  end

  describe '#graphic_id' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:graphic_id) }

    specify { expect { subject.graphic_id }.not_to raise_error }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v3/universe/types/192/?datasource=tranquility&language=en-us')
    end
  end
end
