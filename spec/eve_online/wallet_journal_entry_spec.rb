require 'spec_helper'

describe EveOnline::WalletJournalEntry do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  # def as_json
  #   {
  #       date: date,
  #       ref_id: ref_id,
  #       ref_type_id: ref_type_id,
  #       owner_name1: owner_name1,
  #       owner_id1: owner_id1,
  #       owner_name2: owner_name2,
  #       owner_id2: owner_id2,
  #       arg_name1: arg_name1,
  #       arg_id1: arg_id1,
  #       amount: amount,
  #       balance: balance,
  #       reason: reason,
  #       tax_receiver_id: tax_receiver_id,
  #       tax_amount: tax_amount,
  #       owner1_type_id: owner1_type_id,
  #       owner2_type_id: owner2_type_id
  #   }
  # end
  #
  # def date
  #   @date ||= ActiveSupport::TimeZone['UTC'].parse(options.fetch('@date'))
  # end

  describe '#ref_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@refID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@refID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.ref_id }.not_to raise_error }
  end

  describe '#ref_type_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@refTypeID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@refTypeID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.ref_type_id }.not_to raise_error }
  end

  # def owner_name1
  #   @owner_name1 ||= options.fetch('@ownerName1')
  # end

  describe '#owner_id1' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@ownerID1').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@ownerID1') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.owner_id1 }.not_to raise_error }
  end


  # def owner_name2
  #   @owner_name2 ||= options.fetch('@ownerName2')
  # end

  describe '#owner_id2' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@ownerID2').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@ownerID2') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.owner_id2 }.not_to raise_error }
  end


  # def arg_name1
  #   @arg_name1 ||= options.fetch('@argName1')
  # end

  describe '#arg_id1' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@argID1').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@argID1') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.arg_id1 }.not_to raise_error }
  end


  # def amount
  #   @amount ||= options.fetch('@amount').to_f
  # end
  #
  # def balance
  #   @balance ||= options.fetch('@balance').to_f
  # end
  #
  # def reason
  #   @reason ||= options.fetch('@reason')
  # end
  #
  # def tax_receiver_id
  #   # TODO: to_i
  #   @tax_receiver_id ||= options.fetch('@taxReceiverID')
  # end
  #
  # def tax_amount
  #   @tax_amount ||= options.fetch('@taxAmount')
  # end

  describe '#owner1_type_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@owner1TypeID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@owner1TypeID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.owner1_type_id }.not_to raise_error }
  end

  describe '#owner2_type_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@owner2TypeID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@owner2TypeID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.owner2_type_id }.not_to raise_error }
  end
end
