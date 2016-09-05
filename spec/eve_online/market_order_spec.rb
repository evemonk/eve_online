require 'spec_helper'

describe EveOnline::MarketOrder do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  # def as_json
  #   {
  #       order_id: order_id,
  #       char_id: char_id,
  #       station_id: station_id,
  #       vol_entered: vol_entered,
  #       vol_remaining: vol_remaining,
  #       min_volume: min_volume,
  #       order_state: order_state,
  #       type_id: type_id,
  #       range: range,
  #       account_key: account_key,
  #       duration: duration,
  #       escrow: escrow,
  #       price: price,
  #       bid: bid,
  #       issued: issued
  #   }
  # end
  #
  # def order_id
  #   @order_id ||= options.fetch('@orderID').to_i
  # end
  #
  # def char_id
  #   @char_id ||= options.fetch('@charID').to_i
  # end
  #
  # def station_id
  #   @station_id ||= options.fetch('@stationID').to_i
  # end
  #
  # def vol_entered
  #   @vol_entered ||= options.fetch('@volEntered').to_i
  # end
  #
  # def vol_remaining
  #   @vol_remaining ||= options.fetch('@volRemaining').to_i
  # end
  #
  # def min_volume
  #   @min_volume ||= options.fetch('@minVolume').to_i
  # end
  #
  # def order_state
  #   @order_state ||= options.fetch('@orderState').to_i
  # end
  #
  # def type_id
  #   @type_id ||= options.fetch('@typeID').to_i
  # end
  #
  # def range
  #   @range ||= options.fetch('@range').to_i
  # end
  #
  # def account_key
  #   @account_key ||= options.fetch('@accountKey').to_i
  # end
  #
  # def duration
  #   @duration ||= options.fetch('@duration').to_i
  # end

  describe '#escrow' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@escrow').to_f
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@escrow') do
            double.tap do |b|
              expect(b).to receive(:to_f)
            end
          end
        end
      end
    end

    specify { expect { subject.escrow }.not_to raise_error }
  end

  describe '#price' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@price').to_f
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@price') do
            double.tap do |b|
              expect(b).to receive(:to_f)
            end
          end
        end
      end
    end

    specify { expect { subject.price }.not_to raise_error }
  end

  # def bid
  #   @bid ||= options.fetch('@bid') == '1'
  # end

  describe '#issued' do
    let(:options) { double }

    subject { described_class.new(options) }

    let(:issued) { double }

    before do
      #
      # subject.options.fetch('@issued') => issued
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@issued').and_return(issued)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(issued)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(issued)
        end
      end
    end

    specify { expect { subject.issued }.not_to raise_error }
  end
end
