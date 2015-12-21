require 'spec_helper'

describe EveOnline::Eve::SkillTree do
  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/eve/SkillTree.xml.aspx') }

  describe '#url' do
    specify do
      expect(subject.url).to eq(described_class::API_ENDPOINT)
    end
  end
end
