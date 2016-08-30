require 'spec_helper'

describe EveOnline::SDE::TypeID do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:type_id) { described_class.new(options) }

    let(:data) do
      {
        'groupID' => 0,
        'mass' => 1.0,
        'name' => {
          'de' => '#System',
          'en' => '#System',
          'fr' => '#Système',
          'ja' => '"#システム',
          'ru' => '#Система',
          'zh' => '#星系'
        },
        'portionSize' => 1,
        'published' => false
      }
    end

    before { expect(type_id).to receive(:type_id).and_return(0) }

    before { expect(type_id).to receive(:data).and_return(data) }

    subject { type_id.as_json }

    its([:type_id]) { should eq(0) }

    its([:data]) { should eq(data) }
  end

  describe '#type_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.first
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:first)
        end
      end
    end

    specify { expect { subject.type_id }.not_to raise_error }
  end

  describe '#data' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.last
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:last)
        end
      end
    end

    specify { expect { subject.data }.not_to raise_error }
  end
end
