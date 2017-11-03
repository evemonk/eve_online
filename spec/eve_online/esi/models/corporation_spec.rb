require 'spec_helper'

describe EveOnline::ESI::Models::Corporation do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:corporation) { described_class.new(options) }

    let(:corporation_description) { double }

    let(:creation_date) { double }

    let(:faction) { double }

    before { expect(corporation).to receive(:alliance_id).and_return(99_001_258) }

    before { expect(corporation).to receive(:ceo_id).and_return(1_721_864_142) }

    before { expect(corporation).to receive(:corporation_description).and_return(corporation_description) }

    before { expect(corporation).to receive(:corporation_name).and_return('Bullshit Bingo Club') }

    before { expect(corporation).to receive(:creation_date).and_return(creation_date) }

    before { expect(corporation).to receive(:creator_id).and_return(1_721_864_142) }

    before { expect(corporation).to receive(:faction).and_return(faction) }

    before { expect(corporation).to receive(:member_count).and_return(38) }

    before { expect(corporation).to receive(:tax_rate).and_return(0.1) }

    before { expect(corporation).to receive(:ticker).and_return('BUBIC') }

    before { expect(corporation).to receive(:corporation_url).and_return('http://') }

    subject { corporation.as_json }

    its([:alliance_id]) { should eq(99_001_258) }

    its([:ceo_id]) { should eq(1_721_864_142) }

    its([:corporation_description]) { should eq(corporation_description) }

    its([:corporation_name]) { should eq('Bullshit Bingo Club') }

    its([:creation_date]) { should eq(creation_date) }

    its([:creator_id]) { should eq(1_721_864_142) }

    its([:faction]) { should eq(faction) }

    its([:member_count]) { should eq(38) }

    its([:tax_rate]) { should eq(0.1) }

    its([:ticker]) { should eq('BUBIC') }

    its([:corporation_url]) { should eq('http://') }
  end

  describe '#alliance_id' do
    before { expect(options).to receive(:[]).with('alliance_id') }

    specify { expect { subject.alliance_id }.not_to raise_error }
  end

  describe '#ceo_id' do
    before { expect(options).to receive(:[]).with('ceo_id') }

    specify { expect { subject.ceo_id }.not_to raise_error }
  end

  describe '#corporation_description' do
    before { expect(options).to receive(:[]).with('corporation_description') }

    specify { expect { subject.corporation_description }.not_to raise_error }
  end

  describe '#corporation_name' do
    before { expect(options).to receive(:[]).with('corporation_name') }

    specify { expect { subject.corporation_name }.not_to raise_error }
  end

  describe '#creation_date' do
    context 'creation_date is present' do
      let(:creation_date) { double }

      before { expect(options).to receive(:[]).with('creation_date').and_return(creation_date) }

      before do
        #
        # subject.parse_datetime_with_timezone(creation_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(creation_date)
      end

      specify { expect { subject.creation_date }.not_to raise_error }
    end

    context 'creation_date not present' do
      before { expect(options).to receive(:[]).with('creation_date').and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.creation_date }.not_to raise_error }
    end
  end

  describe '#creator_id' do
    before { expect(options).to receive(:[]).with('creator_id') }

    specify { expect { subject.creator_id }.not_to raise_error }
  end

  describe '#faction' do
    before { expect(options).to receive(:[]).with('faction') }

    specify { expect { subject.faction }.not_to raise_error }
  end

  describe '#member_count' do
    before { expect(options).to receive(:[]).with('member_count') }

    specify { expect { subject.member_count }.not_to raise_error }
  end

  describe '#tax_rate' do
    before { expect(options).to receive(:[]).with('tax_rate') }

    specify { expect { subject.tax_rate }.not_to raise_error }
  end

  describe '#ticker' do
    before { expect(options).to receive(:[]).with('ticker') }

    specify { expect { subject.ticker }.not_to raise_error }
  end

  describe '#corporation_url' do
    before { expect(options).to receive(:[]).with('url') }

    specify { expect { subject.corporation_url }.not_to raise_error }
  end
end
