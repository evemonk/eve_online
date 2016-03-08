require 'spec_helper'

describe EveOnline::Bookmark do
  describe '#initialize' do
    let(:options) { {} }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:bookmark) { described_class.new }

    let(:created) { double }

    before { expect(bookmark).to receive(:bookmark_id).and_return(968_437_335) }

    before { expect(bookmark).to receive(:creator_id).and_return(1_337_512_245) }

    before { expect(bookmark).to receive(:created).and_return(created) }

    before { expect(bookmark).to receive(:item_id).and_return(0) }

    before { expect(bookmark).to receive(:type_id).and_return(5) }

    before { expect(bookmark).to receive(:location_id).and_return(30_004_923) }

    before { expect(bookmark).to receive(:x).and_return(-1_695_475_016_159.96) }

    before { expect(bookmark).to receive(:y).and_return(-136_189_493_280) }

    before { expect(bookmark).to receive(:z).and_return(2_582_546_967_840.08) }

    before { expect(bookmark).to receive(:memo).and_return('Home') }

    before { expect(bookmark).to receive(:note).and_return('Our Home') }

    subject { bookmark.as_json }

    its([:bookmark_id]) { should eq(968_437_335) }

    its([:creator_id]) { should eq(1_337_512_245) }

    its([:created]) { should eq(created) }

    its([:item_id]) { should eq(0) }

    its([:type_id]) { should eq(5) }

    its([:location_id]) { should eq(30_004_923) }

    its([:x]) { should eq(-1_695_475_016_159.96) }

    its([:y]) { should eq(-136_189_493_280) }

    its([:z]) { should eq(2_582_546_967_840.08) }

    its([:memo]) { should eq('Home') }

    its([:note]) { should eq('Our Home') }
  end

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
