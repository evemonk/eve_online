require 'spec_helper'

describe EveOnline::Characters::ChatChannels do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  subject { described_class.new(key_id, v_code) }

  specify { expect(subject).to be_a(EveOnline::BaseXML) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/ChatChannels.xml.aspx') }

  specify { expect(described_class::ACCESS_MASK).to eq(536_870_912) }

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

      its(:character_id) { should eq(nil) }
    end

    context 'with options' do
      let(:options) { { character_id: 12_345_678 } }

      subject { described_class.new(key_id, v_code, options) }

      its(:character_id) { should eq(options[:character_id]) }
    end
  end

  describe '#url' do
    context 'default' do
      specify do
        expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }")
      end
    end

    context 'with character_id' do
      let(:options) { { character_id: 12_345_678 } }

      subject { described_class.new(key_id, v_code, options) }

      specify do
        expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ options[:character_id] }")
      end
    end
  end
end
