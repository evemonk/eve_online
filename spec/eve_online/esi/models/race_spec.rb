# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Models::Race do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:races) { described_class.new(options) }

    before { expect(races).to receive(:alliance_id).and_return(500_002) }

    before { expect(races).to receive(:description).and_return('Once a thriving tribal civilization, the Minmatar...') }

    before { expect(races).to receive(:name).and_return('Minmatar') }

    before { expect(races).to receive(:race_id).and_return(2) }

    subject { races.as_json }

    its([:alliance_id]) { should eq(500_002) }

    its([:description]) { should eq('Once a thriving tribal civilization, the Minmatar...') }

    its([:name]) { should eq('Minmatar') }

    its([:race_id]) { should eq(2) }
  end

  describe '#alliance_id' do
    before { expect(options).to receive(:[]).with('alliance_id') }

    specify { expect { subject.alliance_id }.not_to raise_error }
  end

  describe '#description' do
    before { expect(options).to receive(:[]).with('description') }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe '#name' do
    before { expect(options).to receive(:[]).with('name') }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe '#race_id' do
    before { expect(options).to receive(:[]).with('race_id') }

    specify { expect { subject.race_id }.not_to raise_error }
  end
end
