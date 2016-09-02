require 'spec_helper'

describe EveOnline::Characters::WalletJournal do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  let(:character_id) { 12_345_678 }

  subject { described_class.new(key_id, v_code, character_id) }

  specify { expect(subject).to be_a(EveOnline::BaseXML) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/WalletJournal.xml.aspx') }

  specify { expect(described_class::ACCESS_MASK).to eq(2097152) }

  describe '#initialize' do
    context 'default' do
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

      its(:account_key) { should eq(1000) }

      its(:from_id) { should eq(nil) }

      its(:row_count) { should eq(nil) }
    end

    context 'with options' do
      let(:options) do
        {
          account_key: 1234,
          from_id: 12345,
          row_count: 512
        }
      end

      subject { described_class.new(key_id, v_code, character_id, options) }

      its(:account_key) { should eq(1234) }

      its(:from_id) { should eq(12345) }

      its(:row_count) { should eq(512) }
    end
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }")
    end
  end
end
