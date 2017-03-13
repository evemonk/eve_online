require 'spec_helper'

describe EveOnline::XML::Models::ApiKeyInfo do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#access_mask' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@accessMask').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@accessMask') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.access_mask }.not_to raise_error }
  end

  describe '#api_key_type' do
    let(:options) { double }

    subject { described_class.new(options) }

    let(:type) { double }

    before do
      #
      # subject.options.fetch('@type') => type
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@type').and_return(type)
        end
      end
    end

    before do
      expect(EveOnline::XML::Models::AccountTypeObject).to receive(:new).with(type) do
        double.tap do |a|
          expect(a).to receive(:value)
        end
      end
    end

    specify { expect { subject.api_key_type }.not_to raise_error }
  end

  describe '#expires' do
    let(:options) { double }

    subject { described_class.new(options) }

    let(:expires) { double }

    before do
      #
      # subject.options.fetch('@expires') => expires
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@expires').and_return(expires)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(expires)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(expires)
        end
      end
    end

    specify { expect { subject.expires }.not_to raise_error }
  end
end
