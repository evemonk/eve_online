# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::War do
  let(:options) { { id: 615_578 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq('/v1/wars/%<war_id>s/') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('2.6.0')
      its(:_write_timeout) { should eq(60) }
    end

    its(:datasource) { should eq('tranquility') }

    its(:id) { should eq(615_578) }
  end

  describe '#model' do
    context 'when @model set' do
      let(:model) { instance_double(EveOnline::ESI::Models::War) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context 'when @model not set' do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::War) }

      before do
        #
        # EveOnline::ESI::Models::War.new(response) # => model
        #
        expect(EveOnline::ESI::Models::War).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe '#as_json' do
    let(:model) { instance_double(EveOnline::ESI::Models::War) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  # def_delegators :model, :as_json, :declared, :finished, :war_id, :mutual,
  #                :open_for_allies, :retracted, :started

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#path' do
    specify do
      expect(subject.path).to eq('/v1/wars/615578/')
    end
  end

  describe '#query' do
    specify do
      expect(subject.query).to eq(datasource: 'tranquility')
    end
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v1/wars/615578/?datasource=tranquility')
    end
  end
end
