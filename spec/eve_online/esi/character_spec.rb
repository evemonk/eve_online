require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::ESI::Character do
  let(:character_id) { 1_337_512_245 }

  subject { described_class.new(character_id) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v4/characters/%s/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(character_id) }
  end

  describe '#as_json' do
    before { VCR.insert_cassette 'esi/character/1337512245' }

    after { VCR.eject_cassette }

    let(:character) { described_class.new(character_id) }

    subject { character.as_json }

    its([:corporation_id]) { should eq(98_134_807) }

    its([:birthday]) { should eq(DateTime.new(2010, 1, 15, 15, 26, 0)) }

    its([:name]) { should eq('Johnn Dillinger') }

    its([:gender]) { should eq('male') }

    its([:race_id]) { should eq(2) }

    its([:bloodline_id]) { should eq(4) }

    its([:description]) { should eq('') }

    its([:alliance_id]) { should eq(99_005_443) }

    its([:ancestry_id]) { should eq(24) }

    its([:security_status]) { should eq(1.8694881661345457) }
  end

  # describe '#birthday' do
  #   context 'birthday is present' do
  #     let(:birthday) { double }
  #
  #     before do
  #       #
  #       # subject.response['birthday'] => birthday
  #       #
  #       expect(subject).to receive(:response) do
  #         double.tap do |a|
  #           expect(a).to receive(:[]).with('birthday').and_return(birthday)
  #         end
  #       end
  #     end
  #
  #     before do
  #       #
  #       # subject.parse_datetime_with_timezone(birthday)
  #       #
  #       expect(subject).to receive(:parse_datetime_with_timezone).with(birthday)
  #     end
  #
  #     specify { expect { subject.birthday }.not_to raise_error }
  #   end
  #
  #   context 'birthday not present' do
  #     before do
  #       #
  #       # subject.response['birthday'] => nil
  #       #
  #       expect(subject).to receive(:response) do
  #         double.tap do |a|
  #           expect(a).to receive(:[]).with('birthday').and_return(nil)
  #         end
  #       end
  #     end
  #
  #     before { expect(subject).not_to receive(:parse_datetime_with_timezone) }
  #
  #     specify { expect { subject.birthday }.not_to raise_error }
  #   end
  # end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq(described_class::API_ENDPOINT % character_id)
    end
  end
end
