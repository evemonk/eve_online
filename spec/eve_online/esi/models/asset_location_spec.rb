# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Models::AssetLocation do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:asset_location) { described_class.new(options) }

    before { expect(asset_location).to receive(:item_id).and_return(1_001_215_602_246) }

    subject { asset_location.as_json }

    its([:item_id]) { should eq(1_001_215_602_246) }
  end

  describe '#item_id' do
    before { expect(options).to receive(:[]).with('item_id') }

    specify { expect { subject.item_id }.not_to raise_error }
  end

  describe '#position' do
    context 'when @position set' do
      let(:position) { double }

      before { subject.instance_variable_set(:@position, position) }

      specify { expect(subject.position).to eq(position) }
    end

    context 'when @position not set' do
      let(:position) { double }

      let(:option) { double }

      before do
        #
        # subject.options['position'] => option
        #
        expect(subject).to receive(:options) do
          double.tap do |a|
            expect(a).to receive(:[]).with('position').and_return(option)
          end
        end
      end

      before { expect(EveOnline::ESI::Models::Position).to receive(:new).with(option).and_return(position) }

      specify { expect { subject.position }.not_to raise_error }

      specify { expect { subject.position }.to change { subject.instance_variable_get(:@position) }.from(nil).to(position) }
    end
  end
end
