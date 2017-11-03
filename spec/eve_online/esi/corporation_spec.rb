require 'spec_helper'

describe EveOnline::ESI::Corporation do
  let(:options) { { corporation_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v3/corporations/%s/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:corporation_id) { should eq(12_345_678) }
  end

  describe '#model' do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    let(:model) { double }

    before do
      #
      # EveOnline::ESI::Models::Corporation.new(response) # => model
      #
      expect(EveOnline::ESI::Models::Corporation).to receive(:new).with(response).and_return(model)
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

  describe '#alliance_id' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:alliance_id) }

    specify { expect { subject.alliance_id }.not_to raise_error }
  end

  describe '#ceo_id' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:ceo_id) }

    specify { expect { subject.ceo_id }.not_to raise_error }
  end

  describe '#corporation_description' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:corporation_description) }

    specify { expect { subject.corporation_description }.not_to raise_error }
  end

  describe '#corporation_name' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:corporation_name) }

    specify { expect { subject.corporation_name }.not_to raise_error }
  end

  describe '#creation_date' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:creation_date) }

    specify { expect { subject.creation_date }.not_to raise_error }
  end

  describe '#creator_id' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:creator_id) }

    specify { expect { subject.creator_id }.not_to raise_error }
  end

  describe '#faction' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:faction) }

    specify { expect { subject.faction }.not_to raise_error }
  end

  describe '#member_count' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:member_count) }

    specify { expect { subject.member_count }.not_to raise_error }
  end

  describe '#tax_rate' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:tax_rate) }

    specify { expect { subject.tax_rate }.not_to raise_error }
  end

  describe '#ticker' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:ticker) }

    specify { expect { subject.ticker }.not_to raise_error }
  end

  describe '#corporation_url' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:corporation_url) }

    specify { expect { subject.corporation_url }.not_to raise_error }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v3/corporations/12345678/?datasource=tranquility')
    end
  end
end
