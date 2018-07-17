# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Models::Alliance do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:alliance) { described_class.new(options) }

    let(:date_founded) { double }

    before { expect(alliance).to receive(:creator_corporation_id).and_return(98_306_624) }

    before { expect(alliance).to receive(:creator_id).and_return(94_195_096) }

    before { expect(alliance).to receive(:date_founded).and_return(date_founded) }

    before { expect(alliance).to receive(:executor_corporation_id).and_return(98_306_624) }

    before { expect(alliance).to receive(:faction_id).and_return(500_001) }

    before { expect(alliance).to receive(:name).and_return('Kids With Guns Alliance') }

    before { expect(alliance).to receive(:ticker).and_return('-KWG-') }

    subject { alliance.as_json }

    its([:creator_corporation_id]) { should eq(98_306_624) }

    its([:creator_id]) { should eq(94_195_096) }

    its([:date_founded]) { should eq(date_founded) }

    its([:executor_corporation_id]) { should eq(98_306_624) }

    its([:faction_id]) { should eq(500_001) }

    its([:name]) { should eq('Kids With Guns Alliance') }

    its([:ticker]) { should eq('-KWG-') }
  end

  describe '#creator_corporation_id' do
    before { expect(options).to receive(:[]).with('creator_corporation_id') }

    specify { expect { subject.creator_corporation_id }.not_to raise_error }
  end

  describe '#creator_id' do
    before { expect(options).to receive(:[]).with('creator_id') }

    specify { expect { subject.creator_id }.not_to raise_error }
  end

  describe '#date_founded' do
    context 'when date_founded is present' do
      let(:date_founded) { double }

      before { expect(options).to receive(:[]).with('date_founded').and_return(date_founded) }

      before do
        #
        # subject.parse_datetime_with_timezone(date_founded)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(date_founded)
      end

      specify { expect { subject.date_founded }.not_to raise_error }
    end

    context 'when date_founded not present' do
      before { expect(options).to receive(:[]).with('date_founded').and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.date_founded }.not_to raise_error }
    end
  end

  describe '#executor_corporation_id' do
    before { expect(options).to receive(:[]).with('executor_corporation_id') }

    specify { expect { subject.executor_corporation_id }.not_to raise_error }
  end

  describe '#faction_id' do
    before { expect(options).to receive(:[]).with('faction_id') }

    specify { expect { subject.faction_id }.not_to raise_error }
  end

  describe '#name' do
    before { expect(options).to receive(:[]).with('name') }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe '#ticker' do
    before { expect(options).to receive(:[]).with('ticker') }

    specify { expect { subject.ticker }.not_to raise_error }
  end
end
