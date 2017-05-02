require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::XML::CharacterNotificationTexts do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  let(:character_id) { 12_345_678 }

  let(:ids) { [1, 2] }

  subject { described_class.new(key_id, v_code, character_id, ids) }

  specify { expect(subject).to be_a(EveOnline::XML::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/NotificationTexts.xml.aspx') }

  specify { expect(described_class::ACCESS_MASK).to eq(32_768) }

  describe '#initialize' do
    let(:parser) { double }

    before do
      #
      # Nori.new(advanced_typecasting: false) => double
      #
      expect(Nori).to receive(:new).with(advanced_typecasting: false).and_return(parser)
    end

    its(:parser) { should eq(parser) }

    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }

    its(:character_id) { should eq(character_id) }

    its(:ids) { should eq(ids) }
  end

  describe '#url' do
    let(:escaped_ids) { 123_456 }

    before { expect(subject).to receive(:escaped_ids).and_return(escaped_ids) }

    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&IDs=#{ escaped_ids }")
    end
  end

  # private methods

  describe '#escaped_ids' do
    let(:joined_ids) { double }

    before do
      #
      # subject.ids.join(',') => joined_ids
      #
      expect(subject).to receive(:ids) do
        double.tap do |a|
          expect(a).to receive(:join).with(',').and_return(joined_ids)
        end
      end
    end

    before do
      #
      # URI.escape(joined_ids)
      #
      expect(URI).to receive(:escape).with(joined_ids)
    end

    specify { expect { subject.send(:escaped_ids) }.not_to raise_error }
  end
end
