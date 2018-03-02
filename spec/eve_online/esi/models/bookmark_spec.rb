require 'spec_helper'

describe EveOnline::ESI::Models::Bookmark do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:bookmark) { described_class.new(options) }

    let(:created) { double }

    before { expect(bookmark).to receive(:bookmark_id).and_return(4) }

    before { expect(bookmark).to receive(:folder_id).and_return(5) }

    before { expect(bookmark).to receive(:created).and_return(created) }

    before { expect(bookmark).to receive(:label).and_return('Random location') }

    before { expect(bookmark).to receive(:notes).and_return('This is a random location in space') }

    before { expect(bookmark).to receive(:location_id).and_return(30_003_430) }

    before { expect(bookmark).to receive(:creator_id).and_return(2_112_625_428) }

    subject { bookmark.as_json }

    its([:bookmark_id]) { should eq(4) }

    its([:folder_id]) { should eq(5) }

    its([:created]) { should eq(created) }

    its([:label]) { should eq('Random location') }

    its([:notes]) { should eq('This is a random location in space') }

    its([:location_id]) { should eq(30_003_430) }

    its([:creator_id]) { should eq(2_112_625_428) }
  end

  describe '#bookmark_id' do
    before { expect(options).to receive(:[]).with('bookmark_id') }

    specify { expect { subject.bookmark_id }.not_to raise_error }
  end

  describe '#folder_id' do
    before { expect(options).to receive(:[]).with('folder_id') }

    specify { expect { subject.folder_id }.not_to raise_error }
  end

  describe '#created' do
    context 'created is present' do
      let(:created) { double }

      before { expect(options).to receive(:[]).with('created').and_return(created) }

      before do
        #
        # subject.parse_datetime_with_timezone(created)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(created)
      end

      specify { expect { subject.created }.not_to raise_error }
    end

    context 'created not present' do
      before { expect(options).to receive(:[]).with('created').and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.created }.not_to raise_error }
    end
  end

  describe '#label' do
    before { expect(options).to receive(:[]).with('label') }

    specify { expect { subject.label }.not_to raise_error }
  end

  describe '#notes' do
    before { expect(options).to receive(:[]).with('notes') }

    specify { expect { subject.notes }.not_to raise_error }
  end

  describe '#location_id' do
    before { expect(options).to receive(:[]).with('location_id') }

    specify { expect { subject.location_id }.not_to raise_error }
  end

  describe '#creator_id' do
    before { expect(options).to receive(:[]).with('creator_id') }

    specify { expect { subject.creator_id }.not_to raise_error }
  end
end
