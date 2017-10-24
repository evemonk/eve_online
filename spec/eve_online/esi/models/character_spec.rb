require 'spec_helper'

describe EveOnline::ESI::Models::Character do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:character) { described_class.new(options) }

    let(:birthday) { double }

    before { expect(character).to receive(:corporation_id).and_return(12_345_678) }

    before { expect(character).to receive(:birthday).and_return(birthday) }

    before { expect(character).to receive(:name).and_return('Green Black') }

    before { expect(character).to receive(:gender).and_return('male') }

    before { expect(character).to receive(:race_id).and_return(2) }

    before { expect(character).to receive(:bloodline_id).and_return(4) }

    before { expect(character).to receive(:description).and_return('') }

    before { expect(character).to receive(:alliance_id).and_return(98_765_432) }

    before { expect(character).to receive(:ancestry_id).and_return(24) }

    before { expect(character).to receive(:security_status).and_return(1.8694881661345457) }

    subject { character.as_json }

    its([:corporation_id]) { should eq(12_345_678) }

    its([:birthday]) { should eq(birthday) }

    its([:name]) { should eq('Green Black') }

    its([:gender]) { should eq('male') }

    its([:race_id]) { should eq(2) }

    its([:bloodline_id]) { should eq(4) }

    its([:description]) { should eq('') }

    its([:alliance_id]) { should eq(98_765_432) }

    its([:ancestry_id]) { should eq(24) }

    its([:security_status]) { should eq(1.8694881661345457) }
  end

  describe '#corporation_id' do
    before { expect(options).to receive(:[]).with('corporation_id') }

    specify { expect { subject.corporation_id }.not_to raise_error }
  end

  describe '#birthday' do
    context 'birthday is present' do
      let(:birthday) { double }

      before { expect(options).to receive(:[]).with('birthday').and_return(birthday) }

      before do
        #
        # subject.parse_datetime_with_timezone(birthday)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(birthday)
      end

      specify { expect { subject.birthday }.not_to raise_error }
    end

    context 'birthday not present' do
      before { expect(options).to receive(:[]).with('birthday').and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.birthday }.not_to raise_error }
    end
  end

  describe '#name' do
    before { expect(options).to receive(:[]).with('name') }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe '#gender' do
    before { expect(options).to receive(:[]).with('gender') }

    specify { expect { subject.gender }.not_to raise_error }
  end

  describe '#race_id' do
    before { expect(options).to receive(:[]).with('race_id') }

    specify { expect { subject.race_id }.not_to raise_error }
  end

  describe '#bloodline_id' do
    before { expect(options).to receive(:[]).with('bloodline_id') }

    specify { expect { subject.bloodline_id }.not_to raise_error }
  end

  describe '#description' do
    before { expect(options).to receive(:[]).with('description') }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe '#alliance_id' do
    before { expect(options).to receive(:[]).with('alliance_id') }

    specify { expect { subject.alliance_id }.not_to raise_error }
  end

  describe '#ancestry_id' do
    before { expect(options).to receive(:[]).with('ancestry_id') }

    specify { expect { subject.ancestry_id }.not_to raise_error }
  end

  describe '#security_status' do
    before { expect(options).to receive(:[]).with('security_status') }

    specify { expect { subject.security_status }.not_to raise_error }
  end
end
