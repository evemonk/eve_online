require 'spec_helper'

describe EveOnline::ESI::Models::Attributes do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:attributes) { described_class.new(options) }

    let(:last_remap_date) { double }

    let(:accrued_remap_cooldown_date) { double }

    before { expect(attributes).to receive(:charisma).and_return(20) }

    before { expect(attributes).to receive(:intelligence).and_return(24) }

    before { expect(attributes).to receive(:memory).and_return(24) }

    before { expect(attributes).to receive(:perception).and_return(23) }

    before { expect(attributes).to receive(:willpower).and_return(23) }

    before { expect(attributes).to receive(:bonus_remaps).and_return(2) }

    before { expect(attributes).to receive(:last_remap_date).and_return(last_remap_date) }

    before { expect(attributes).to receive(:accrued_remap_cooldown_date).and_return(accrued_remap_cooldown_date) }

    subject { attributes.as_json }

    its([:charisma]) { should eq(20) }

    its([:intelligence]) { should eq(24) }

    its([:memory]) { should eq(24) }

    its([:perception]) { should eq(23) }

    its([:willpower]) { should eq(23) }

    its([:bonus_remaps]) { should eq(2) }

    its([:last_remap_date]) { should eq(last_remap_date) }

    its([:accrued_remap_cooldown_date]) { should eq(accrued_remap_cooldown_date) }
  end

  describe '#charisma' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options['charisma']
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:[]).with('charisma')
        end
      end
    end

    specify { expect { subject.charisma }.not_to raise_error }
  end

  describe '#intelligence' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options['intelligence']
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:[]).with('intelligence')
        end
      end
    end

    specify { expect { subject.intelligence }.not_to raise_error }
  end

  describe '#memory' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options['memory']
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:[]).with('memory')
        end
      end
    end

    specify { expect { subject.memory }.not_to raise_error }
  end

  describe '#perception' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options['perception']
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:[]).with('perception')
        end
      end
    end

    specify { expect { subject.perception }.not_to raise_error }
  end

  describe '#willpower' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options['willpower']
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:[]).with('willpower')
        end
      end
    end

    specify { expect { subject.willpower }.not_to raise_error }
  end

  describe '#bonus_remaps' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options['bonus_remaps']
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:[]).with('bonus_remaps')
        end
      end
    end

    specify { expect { subject.bonus_remaps }.not_to raise_error }
  end

  describe '#last_remap_date' do
    context 'last_remap_date is present' do
      let(:last_remap_date) { double }

      before do
        #
        # subject.options['last_remap_date'] => last_remap_date
        #
        expect(subject).to receive(:options) do
          double.tap do |a|
            expect(a).to receive(:[]).with('last_remap_date').and_return(last_remap_date)
          end
        end
      end

      before do
        #
        # subject.parse_datetime_with_timezone(last_remap_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(last_remap_date)
      end

      specify { expect { subject.last_remap_date }.not_to raise_error }
    end

    context 'last_remap_date not present' do
      before do
        #
        # subject.options['last_remap_date'] => nil
        #
        expect(subject).to receive(:options) do
          double.tap do |a|
            expect(a).to receive(:[]).with('last_remap_date').and_return(nil)
          end
        end
      end

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.last_remap_date }.not_to raise_error }
    end
  end


  describe '#accrued_remap_cooldown_date' do
    context 'accrued_remap_cooldown_date is present' do
      let(:accrued_remap_cooldown_date) { double }

      before do
        #
        # subject.options['accrued_remap_cooldown_date'] => accrued_remap_cooldown_date
        #
        expect(subject).to receive(:options) do
          double.tap do |a|
            expect(a).to receive(:[]).with('accrued_remap_cooldown_date').and_return(accrued_remap_cooldown_date)
          end
        end
      end

      before do
        #
        # subject.parse_datetime_with_timezone(accrued_remap_cooldown_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(accrued_remap_cooldown_date)
      end

      specify { expect { subject.accrued_remap_cooldown_date }.not_to raise_error }
    end

    context 'accrued_remap_cooldown_date not present' do
      before do
        #
        # subject.options['accrued_remap_cooldown_date'] => nil
        #
        expect(subject).to receive(:options) do
          double.tap do |a|
            expect(a).to receive(:[]).with('accrued_remap_cooldown_date').and_return(nil)
          end
        end
      end

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.accrued_remap_cooldown_date }.not_to raise_error }
    end
  end
end
