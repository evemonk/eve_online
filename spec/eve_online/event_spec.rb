require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::Event do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:event) { described_class.new(options) }

    let(:event_date) { double }

    before { expect(event).to receive(:event_id).and_return(1_234_567) }

    before { expect(event).to receive(:owner_id).and_return(87_654_321) }

    before { expect(event).to receive(:owner_name).and_return('MyCorp') }

    before { expect(event).to receive(:event_date).and_return(event_date) }

    before { expect(event).to receive(:event_title).and_return('Control tower Name in 9-9999 goes off') }

    before { expect(event).to receive(:duration).and_return(60) }

    before { expect(event).to receive(:importance).and_return(false) }

    before { expect(event).to receive(:response).and_return(:undecided) }

    before { expect(event).to receive(:event_text).and_return('<b>Minmatar Control Tower Small</b> will run out of fuel and go offline.') }

    before { expect(event).to receive(:owner_type_id).and_return(2) }

    subject { event.as_json }

    its([:event_id]) { should eq(1_234_567) }

    its([:owner_id]) { should eq(87_654_321) }

    its([:owner_name]) { should eq('MyCorp') }

    its([:event_date]) { should eq(event_date) }

    its([:event_title]) { should eq('Control tower Name in 9-9999 goes off') }

    its([:duration]) { should eq(60) }

    its([:importance]) { should eq(false) }

    its([:response]) { should eq(:undecided) }

    its([:event_text]) { should eq('<b>Minmatar Control Tower Small</b> will run out of fuel and go offline.') }

    its([:owner_type_id]) { should eq(2) }
  end

  describe '#event_id' do
    let(:options) { double }

    subject { described_class.new(options) }

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
    let(:options) { double }

    subject { described_class.new(options) }

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
    let(:options) { double }

    subject { described_class.new(options) }

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
    let(:options) { double }

    subject { described_class.new(options) }

    let(:event_date) { double }

    before do
      #
      # subject.options.fetch('@eventDate') => event_date
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@eventDate').and_return(event_date)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(event_date)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(event_date)
        end
      end
    end

    specify { expect { subject.event_date }.not_to raise_error }
  end

  describe '#event_title' do
    let(:options) { double }

    subject { described_class.new(options) }

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

  describe '#importance' do
    let(:options) { double }

    subject { described_class.new(options) }

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
    let(:options) { double }

    subject { described_class.new(options) }

    let(:response) { double }

    before do
      #
      # subject.options.fetch('@response') => double
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@response').and_return(response)
        end
      end
    end

    before do
      expect(EveOnline::EventResponseObject).to receive(:new).with(response) do
        double.tap do |a|
          expect(a).to receive(:value)
        end
      end
    end

    specify { expect { subject.response }.not_to raise_error }
  end

  describe '#event_text' do
    let(:options) { double }

    subject { described_class.new(options) }

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
    let(:options) { double }

    subject { described_class.new(options) }

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
