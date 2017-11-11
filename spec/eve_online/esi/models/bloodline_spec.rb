require 'spec_helper'

describe EveOnline::ESI::Models::Bloodline do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:bloodline) { described_class.new(options) }

    before { expect(bloodline).to receive(:bloodline_id).and_return(4) }

    before { expect(bloodline).to receive(:name).and_return('Brutor') }

    before { expect(bloodline).to receive(:description).and_return('A martial, strong-willed people, the Brutor...') }

    before { expect(bloodline).to receive(:race_id).and_return(2) }

    before { expect(bloodline).to receive(:ship_type_id).and_return(588) }

    before { expect(bloodline).to receive(:corporation_id).and_return(1_000_049) }

    before { expect(bloodline).to receive(:perception).and_return(9) }

    before { expect(bloodline).to receive(:willpower).and_return(7) }

    before { expect(bloodline).to receive(:charisma).and_return(6) }

    before { expect(bloodline).to receive(:memory).and_return(4) }

    before { expect(bloodline).to receive(:intelligence).and_return(4) }

    subject { bloodline.as_json }

    its([:bloodline_id]) { should eq(4) }

    its([:name]) { should eq('Brutor') }

    its([:description]) { should eq('A martial, strong-willed people, the Brutor...') }

    its([:race_id]) { should eq(2) }

    its([:ship_type_id]) { should eq(588) }

    its([:corporation_id]) { should eq(1_000_049) }

    its([:perception]) { should eq(9) }

    its([:willpower]) { should eq(7) }

    its([:charisma]) { should eq(6) }

    its([:memory]) { should eq(4) }

    its([:intelligence]) { should eq(4) }
  end

  describe '#bloodline_id' do
    before { expect(options).to receive(:[]).with('bloodline_id') }

    specify { expect { subject.bloodline_id }.not_to raise_error }
  end

  describe '#name' do
    before { expect(options).to receive(:[]).with('name') }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe '#description' do
    before { expect(options).to receive(:[]).with('description') }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe '#race_id' do
    before { expect(options).to receive(:[]).with('race_id') }

    specify { expect { subject.race_id }.not_to raise_error }
  end

  describe '#ship_type_id' do
    before { expect(options).to receive(:[]).with('ship_type_id') }

    specify { expect { subject.ship_type_id }.not_to raise_error }
  end

  describe '#corporation_id' do
    before { expect(options).to receive(:[]).with('corporation_id') }

    specify { expect { subject.corporation_id }.not_to raise_error }
  end

  describe '#perception' do
    before { expect(options).to receive(:[]).with('perception') }

    specify { expect { subject.perception }.not_to raise_error }
  end

  describe '#willpower' do
    before { expect(options).to receive(:[]).with('willpower') }

    specify { expect { subject.willpower }.not_to raise_error }
  end

  describe '#charisma' do
    before { expect(options).to receive(:[]).with('charisma') }

    specify { expect { subject.charisma }.not_to raise_error }
  end

  describe '#memory' do
    before { expect(options).to receive(:[]).with('memory') }

    specify { expect { subject.memory }.not_to raise_error }
  end

  describe '#intelligence' do
    before { expect(options).to receive(:[]).with('intelligence') }

    specify { expect { subject.intelligence }.not_to raise_error }
  end
end
