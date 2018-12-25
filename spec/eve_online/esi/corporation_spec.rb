# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Corporation do
  let(:options) { { corporation_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(subject).to be_a(EveOnline::ESI::ResponseWithEtag) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v4/corporations/%<corporation_id>s/?datasource=%<datasource>s') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:datasource) { should eq('tranquility') }

    its(:corporation_id) { should eq(12_345_678) }
  end

  describe '#model' do
    context 'when @model set' do
      let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context 'when @model not set' do
      let(:response_with_etag) { double }

      before { expect(subject).to receive(:response_with_etag).and_return(response_with_etag) }

      let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

      before do
        #
        # EveOnline::ESI::Models::Corporation.new(response_with_etag) # => model
        #
        expect(EveOnline::ESI::Models::Corporation).to receive(:new).with(response_with_etag).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe '#as_json' do
    let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe '#alliance_id' do
    let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:alliance_id) }

    specify { expect { subject.alliance_id }.not_to raise_error }
  end

  describe '#ceo_id' do
    let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:ceo_id) }

    specify { expect { subject.ceo_id }.not_to raise_error }
  end

  describe '#creator_id' do
    let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:creator_id) }

    specify { expect { subject.creator_id }.not_to raise_error }
  end

  describe '#date_founded' do
    let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:date_founded) }

    specify { expect { subject.date_founded }.not_to raise_error }
  end

  describe '#description' do
    let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:description) }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe '#faction_id' do
    let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:faction_id) }

    specify { expect { subject.faction_id }.not_to raise_error }
  end

  describe '#home_station_id' do
    let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:home_station_id) }

    specify { expect { subject.home_station_id }.not_to raise_error }
  end

  describe '#member_count' do
    let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:member_count) }

    specify { expect { subject.member_count }.not_to raise_error }
  end

  describe '#name' do
    let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:name) }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe '#shares' do
    let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:shares) }

    specify { expect { subject.shares }.not_to raise_error }
  end

  describe '#tax_rate' do
    let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:tax_rate) }

    specify { expect { subject.tax_rate }.not_to raise_error }
  end

  describe '#ticker' do
    let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:ticker) }

    specify { expect { subject.ticker }.not_to raise_error }
  end

  describe '#corporation_url' do
    let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:corporation_url) }

    specify { expect { subject.corporation_url }.not_to raise_error }
  end

  describe '#etag' do
    let(:model) { instance_double(EveOnline::ESI::Models::Corporation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:etag) }

    specify { expect { subject.etag }.not_to raise_error }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v4/corporations/12345678/?datasource=tranquility')
    end
  end
end
