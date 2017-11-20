require 'spec_helper'

describe EveOnline::ESI::DogmaAttributes do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v1/dogma/attributes/?datasource=tranquility') }

  describe '#initialize' do
    its(:parser) { should eq(JSON) }
  end

  describe '#attributes' do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    specify { expect(subject.attributes).to eq(response) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v1/dogma/attributes/?datasource=tranquility')
    end
  end
end
