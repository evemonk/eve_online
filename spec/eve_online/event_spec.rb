require 'spec_helper'

describe EveOnline::Event do
  describe '#initialize' do
    let(:options) { {} }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#event_id' do
    before do
      #
      # subject.options.fetch('@eventID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@eventID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.event_id }.not_to raise_error }
  end


  describe '#owner_id' do
    before do
      #
      # subject.options.fetch('@ownerID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@ownerID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.owner_id }.not_to raise_error }
  end

  describe '#owner_name' do
    before do
      #
      # subject.options.fetch('@ownerName')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@ownerName')
        end
      end
    end

    specify { expect { subject.owner_name }.not_to raise_error }
  end

  describe '#event_date' do
    before do
      #
      # subject.options.fetch('@eventDate') => '2015-11-22 16:47:40'
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@eventDate').and_return('2015-11-22 16:47:40')
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(options.fetch('@eventDate'))
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with('2015-11-22 16:47:40')
        end
      end
    end

    specify { expect { subject.event_date }.not_to raise_error }
  end

  describe '#event_title' do
    before do
      #
      # subject.options.fetch('@eventTitle')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@eventTitle')
        end
      end
    end

    specify { expect { subject.event_title }.not_to raise_error }
  end

  describe '#duration' do
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

  describe '#importance' do
    before do
      #
      # subject.options.fetch('@importance').eql?('1')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@importance') do
            double.tap do |b|
              expect(b).to receive(:eql?).with('1')
            end
          end
        end
      end
    end

    specify { expect { subject.importance }.not_to raise_error }
  end

  describe '#response' do
    before do
      #
      # subject.options.fetch('@response')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@response')
        end
      end
    end

    specify { expect { subject.response }.not_to raise_error }
  end

  describe '#event_text' do
    before do
      #
      # subject.options.fetch('@eventText')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@eventText')
        end
      end
    end

    specify { expect { subject.event_text }.not_to raise_error }
  end


  describe '#owner_type_id' do
    before do
      #
      # subject.options.fetch('@ownerTypeID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@ownerTypeID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.owner_type_id }.not_to raise_error }
  end
end
