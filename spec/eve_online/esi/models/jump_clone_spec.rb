require 'spec_helper'

describe EveOnline::ESI::Models::JumpClone do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:jump_clone) { described_class.new(options) }

    before { expect(jump_clone).to receive(:location_id).and_return(61_000_032) }

    before { expect(jump_clone).to receive(:location_type).and_return('station') }

    before { expect(jump_clone).to receive(:implants).and_return([22118]) }

    subject { jump_clone.as_json }

    its([:location_id]) { should eq(61_000_032) }

    its([:location_type]) { should eq('station') }

    its([:implants]) { should eq([22118]) }
  end

  describe '#location_id' do
    before { expect(options).to receive(:[]).with('location_id') }

    specify { expect { subject.location_id }.not_to raise_error }
  end

  describe '#location_type' do
    before { expect(options).to receive(:[]).with('location_type') }

    specify { expect { subject.location_type }.not_to raise_error }
  end

  describe '#implants' do
    before { expect(options).to receive(:[]).with('implants') }

    specify { expect { subject.implants }.not_to raise_error }
  end
end
