require 'spec_helper'

describe EveOnline::ESI::CharacterWallet do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/latest/characters/%s/wallet/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq('token123') }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe '#as_json' do
    let(:wallet) { described_class.new(options) }

    let(:response) { double }

    before { expect(wallet).to receive(:response).and_return(response) }

    subject { wallet.as_json }

    its([:wallet]) { should eq(response) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-wallet.read_character_wallet.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/latest/characters/12345678/wallet/?datasource=tranquility')
    end
  end
end
