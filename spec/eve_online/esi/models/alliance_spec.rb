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

    before { expect(alliance).to receive(:alliance_name).and_return('Kids With Guns Alliance') }

    before { expect(alliance).to receive(:ticker).and_return('-KWG-') }

    before { expect(alliance).to receive(:date_founded).and_return(date_founded) }

    before { expect(alliance).to receive(:executor_corp).and_return(98_306_624) }

    subject { alliance.as_json }

    its([:alliance_name]) { should eq('Kids With Guns Alliance') }

    its([:ticker]) { should eq('-KWG-') }

    its([:date_founded]) { should eq(date_founded) }

    its([:executor_corp]) { should eq(98_306_624) }
  end

  describe '#alliance_name' do
    before { expect(options).to receive(:[]).with('alliance_name') }

    specify { expect { subject.alliance_name }.not_to raise_error }
  end

  describe '#ticker' do
    before { expect(options).to receive(:[]).with('ticker') }

    specify { expect { subject.ticker }.not_to raise_error }
  end

  describe '#date_founded' do
    context 'date_founded is present' do
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

    context 'date_founded not present' do
      before { expect(options).to receive(:[]).with('date_founded').and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.date_founded }.not_to raise_error }
    end
  end

  describe '#executor_corp' do
    before { expect(options).to receive(:[]).with('executor_corp') }

    specify { expect { subject.executor_corp }.not_to raise_error }
  end
end
