require 'spec_helper'

describe EveOnline::Bookmark do
  describe '#initialize' do
    let(:options) { {} }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  # def as_json(*args)
  #   {
  #       bookmark_id: bookmark_id,
  #       creator_id: creator_id,
  #       created: created,
  #       item_id: item_id,
  #       type_id: type_id,
  #       location_id: location_id,
  #       x: x,
  #       y: y,
  #       z: z,
  #       memo: memo,
  #       note: note
  #   }
  # end

  describe '#bookmark_id' do
    before do
      #
      # subject.options.fetch('@bookmarkID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@bookmarkID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.bookmark_id }.not_to raise_error }
  end

  describe '#creator_id' do
    before do
      #
      # subject.options.fetch('@creatorID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@creatorID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.creator_id }.not_to raise_error }
  end

  describe '#created' do
    let(:created) { double }

    before do
      #
      # subject.options.fetch('@created') => created
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@created').and_return(created)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(created)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(created)
        end
      end
    end

    specify { expect { subject.created }.not_to raise_error }
  end

  describe '#item_id' do
    before do
      #
      # subject.options.fetch('@itemID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@itemID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.item_id }.not_to raise_error }
  end

  describe '#type_id' do
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

  describe '#location_id' do
    before do
      #
      # subject.options.fetch('@locationID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@locationID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.location_id }.not_to raise_error }
  end

  describe '#x' do
    before do
      #
      # subject.options.fetch('@x').to_f
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@x') do
            double.tap do |b|
              expect(b).to receive(:to_f)
            end
          end
        end
      end
    end

    specify { expect { subject.x }.not_to raise_error }
  end

  describe '#y' do
    before do
      #
      # subject.options.fetch('@y').to_f
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@y') do
            double.tap do |b|
              expect(b).to receive(:to_f)
            end
          end
        end
      end
    end

    specify { expect { subject.y }.not_to raise_error }
  end

  describe '#z' do
    before do
      #
      # subject.options.fetch('@z').to_f
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@z') do
            double.tap do |b|
              expect(b).to receive(:to_f)
            end
          end
        end
      end
    end

    specify { expect { subject.z }.not_to raise_error }
  end

  describe '#memo' do
    before do
      #
      # subject.options.fetch('@memo')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@memo')
        end
      end
    end

    specify { expect { subject.memo }.not_to raise_error }
  end

  describe '#note' do
    before do
      #
      # subject.options.fetch('@note')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@note')
        end
      end
    end

    specify { expect { subject.note }.not_to raise_error }
  end
end
