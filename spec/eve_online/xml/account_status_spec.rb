require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::XML::AccountStatus do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  subject { described_class.new(key_id, v_code) }

  specify { expect(subject).to be_a(EveOnline::XML::Base) }

  specify { expect(described_class).to be_a(Forwardable) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/account/AccountStatus.xml.aspx') }

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
      # EveOnline::XML::Models::AccountStatus.new(result)
      #
      expect(EveOnline::XML::Models::AccountStatus).to receive(:new).with(result)
    end

    specify { expect { subject.model }.not_to raise_error }

    specify { expect { subject.model }.to change { subject.instance_variable_defined?(:@_memoized_model) }.from(false).to(true) }
  end

  describe '#as_json' do
    before do
      #
      # subject.model.as_json
      #
      expect(subject).to receive(:model) do
        double.tap do |a|
          expect(a).to receive(:as_json)
        end
      end
    end

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe '#paid_until' do
    before do
      #
      # subject.model.paid_until
      #
      expect(subject).to receive(:model) do
        double.tap do |a|
          expect(a).to receive(:paid_until)
        end
      end
    end

    specify { expect { subject.paid_until }.not_to raise_error }
  end

  describe '#create_date' do
    before do
      #
      # subject.model.create_date
      #
      expect(subject).to receive(:model) do
        double.tap do |a|
          expect(a).to receive(:create_date)
        end
      end
    end

    specify { expect { subject.create_date }.not_to raise_error }
  end

  describe '#logon_count' do
    before do
      #
      # subject.model.logon_count
      #
      expect(subject).to receive(:model) do
        double.tap do |a|
          expect(a).to receive(:logon_count)
        end
      end
    end

    specify { expect { subject.logon_count }.not_to raise_error }
  end

  describe '#logon_minutes' do
    before do
      #
      # subject.model.logon_minutes
      #
      expect(subject).to receive(:model) do
        double.tap do |a|
          expect(a).to receive(:logon_minutes)
        end
      end
    end

    specify { expect { subject.logon_minutes }.not_to raise_error }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }")
    end
  end
end
