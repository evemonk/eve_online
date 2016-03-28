require 'spec_helper'

describe EveOnline::CREST::Sovereignty::Campaigns do
  specify { expect(subject).to be_a(EveOnline::CREST::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://public-crest.eveonline.com/sovereignty/campaigns/') }

  describe '#url' do
    specify { expect(subject.url).to eq(described_class::API_ENDPOINT) }
  end
end
