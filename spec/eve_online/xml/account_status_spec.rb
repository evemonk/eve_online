require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::XML::AccountStatus do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  subject { described_class.new(key_id, v_code) }

  specify { expect(subject).to be_a(EveOnline::BaseXML) }

  specify { expect(described_class).to be_a(Forwardable) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/account/AccountStatus.xml.aspx') }

  # def_delegators :model, :as_json, :paid_until, :create_date, :logon_count, :logon_minutes

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
  end

  describe '#model' do
    let(:result) { double }

    before { expect(subject).to receive(:result).and_return(result) }

    before do
      #
      # Models::AccountStatus.new(result)
      #
      expect(EveOnline::XML::Models::AccountStatus).to receive(:new).with(result)
    end

    specify { expect { subject.model }.not_to raise_error }

    specify { expect { subject.model }.to change { subject.instance_variable_defined?(:@_memoized_model) }.from(false).to(true) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }")
    end
  end
end
