# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Character do
  let(:options) { { character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq('/v4/characters/%<character_id>s/') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('2.6.0')
      its(:_write_timeout) { should eq(60) }
    end

    its(:datasource) { should eq('tranquility') }

    its(:character_id) { should eq(12_345_678) }
  end

  describe '#model' do
    context 'when @model set' do
      let(:model) { instance_double(EveOnline::ESI::Models::Character) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context 'when @model not set' do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::Character) }

      before do
        #
        # EveOnline::ESI::Models::Character.new(response) # => model
        #
        expect(EveOnline::ESI::Models::Character).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe '#as_json' do
    let(:model) { instance_double(EveOnline::ESI::Models::Character) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe '#alliance_id' do
    let(:model) { instance_double(EveOnline::ESI::Models::Character) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:alliance_id) }

    specify { expect { subject.alliance_id }.not_to raise_error }
  end

  describe '#ancestry_id' do
    let(:model) { instance_double(EveOnline::ESI::Models::Character) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:ancestry_id) }

    specify { expect { subject.ancestry_id }.not_to raise_error }
  end

  describe '#birthday' do
    let(:model) { instance_double(EveOnline::ESI::Models::Character) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:birthday) }

    specify { expect { subject.birthday }.not_to raise_error }
  end

  describe '#bloodline_id' do
    let(:model) { instance_double(EveOnline::ESI::Models::Character) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:bloodline_id) }

    specify { expect { subject.bloodline_id }.not_to raise_error }
  end

  describe '#corporation_id' do
    let(:model) { instance_double(EveOnline::ESI::Models::Character) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:corporation_id) }

    specify { expect { subject.corporation_id }.not_to raise_error }
  end

  describe '#description' do
    let(:model) { instance_double(EveOnline::ESI::Models::Character) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:description) }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe '#faction_id' do
    let(:model) { instance_double(EveOnline::ESI::Models::Character) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:faction_id) }

    specify { expect { subject.faction_id }.not_to raise_error }
  end

  describe '#gender' do
    let(:model) { instance_double(EveOnline::ESI::Models::Character) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:gender) }

    specify { expect { subject.gender }.not_to raise_error }
  end

  describe '#name' do
    let(:model) { instance_double(EveOnline::ESI::Models::Character) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:name) }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe '#race_id' do
    let(:model) { instance_double(EveOnline::ESI::Models::Character) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:race_id) }

    specify { expect { subject.race_id }.not_to raise_error }
  end

  describe '#security_status' do
    let(:model) { instance_double(EveOnline::ESI::Models::Character) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:security_status) }

    specify { expect { subject.security_status }.not_to raise_error }
  end

  describe '#title' do
    let(:model) { instance_double(EveOnline::ESI::Models::Character) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:title) }

    specify { expect { subject.title }.not_to raise_error }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#path' do
    specify do
      expect(subject.path).to eq('/v4/characters/12345678/')
    end
  end

  describe '#query' do
    specify do
      expect(subject.query).to eq(datasource: 'tranquility')
    end
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v4/characters/12345678/?datasource=tranquility')
    end
  end
end
