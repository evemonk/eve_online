require 'spec_helper'

describe EveOnline::MarketOrder do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:market_order) { described_class.new(options) }

    let(:issued) { double }

    before { expect(market_order).to receive(:order_id).and_return(4053334100) }

    before { expect(market_order).to receive(:char_id).and_return(1801683792) }

    before { expect(market_order).to receive(:station_id).and_return(60005686) }

    before { expect(market_order).to receive(:vol_entered).and_return(340000) }

    before { expect(market_order).to receive(:vol_remaining).and_return(245705) }

    before { expect(market_order).to receive(:min_volume).and_return(1) }

    before { expect(market_order).to receive(:order_state).and_return(0) }

    before { expect(market_order).to receive(:type_id).and_return(24488) }

    before { expect(market_order).to receive(:range).and_return(32767) }

    before { expect(market_order).to receive(:account_key).and_return(1000) }

    before { expect(market_order).to receive(:duration).and_return(90) }

    before { expect(market_order).to receive(:escrow).and_return(0.00) }

    before { expect(market_order).to receive(:price).and_return(92.00) }

    before { expect(market_order).to receive(:bid).and_return(false) }

    before { expect(market_order).to receive(:issued).and_return(issued) }

    subject { market_order.as_json }

    its([:order_id]) { should eq(4053334100) }

    its([:char_id]) { should eq(1801683792) }

    its([:station_id]) { should eq(60005686) }

    its([:vol_entered]) { should eq(340000) }

    its([:vol_remaining]) { should eq(245705) }

    its([:min_volume]) { should eq(1) }

    its([:order_state]) { should eq(0) }

    its([:type_id]) { should eq(24488) }

    its([:range]) { should eq(32767) }

    its([:account_key]) { should eq(1000) }

    its([:duration]) { should eq(90) }

    its([:escrow]) { should eq(0.00) }

    its([:price]) { should eq(92.00) }

    its([:bid]) { should eq(false) }

    its([:issued]) { should eq(issued) }
  end

  describe '#order_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@orderID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@orderID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.order_id }.not_to raise_error }
  end

  describe '#char_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@charID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@charID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.char_id }.not_to raise_error }
  end

  describe '#station_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@stationID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@stationID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.station_id }.not_to raise_error }
  end

  describe '#vol_entered' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@volEntered').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@volEntered') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.vol_entered }.not_to raise_error }
  end

  describe '#vol_remaining' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@volRemaining').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@volRemaining') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.vol_remaining }.not_to raise_error }
  end

  describe '#min_volume' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@minVolume').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@minVolume') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.min_volume }.not_to raise_error }
  end

  describe '#order_state' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@orderState').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@orderState') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.order_state }.not_to raise_error }
  end

  describe '#type_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@typeID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@typeID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.type_id }.not_to raise_error }
  end

  describe '#range' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@range').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@range') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.range }.not_to raise_error }
  end

  describe '#account_key' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@accountKey').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@accountKey') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.account_key }.not_to raise_error }
  end

  describe '#duration' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@duration').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@duration') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.duration }.not_to raise_error }
  end

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

  describe '#bid' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@bid') == '1'
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@bid') do
            double.tap do |b|
              expect(b).to receive(:==).with('1')
            end
          end
        end
      end
    end

    specify { expect { subject.bid }.not_to raise_error }
  end

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
