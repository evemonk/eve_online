require 'spec_helper'

describe EveOnline::ESI::CharacterOnline do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v2/characters/%s/online/?datasource=tranquility') }

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
      # EveOnline::ESI::Models::Online.new(response) # => model
      #
      expect(EveOnline::ESI::Models::Online).to receive(:new).with(response).and_return(model)
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

  describe '#online' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:online) }

    specify { expect { subject.online }.not_to raise_error }
  end

  describe '#last_login' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:last_login) }

    specify { expect { subject.last_login }.not_to raise_error }
  end

  describe '#last_logout' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:last_logout) }

    specify { expect { subject.last_logout }.not_to raise_error }
  end

  describe '#logins' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:logins) }

    specify { expect { subject.logins }.not_to raise_error }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-location.read_online.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v2/characters/12345678/online/?datasource=tranquility')
    end
  end
end
