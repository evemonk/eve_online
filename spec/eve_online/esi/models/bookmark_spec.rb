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

    let(:item_id) { double }

    let(:item_type_id) { double }

    let(:coordinate_x) { double }

    let(:coordinate_y) { double }

    let(:coordinate_z) { double }

    before { expect(bookmark).to receive(:bookmark_id).and_return(4) }

    before { expect(bookmark).to receive(:folder_id).and_return(5) }

    before { expect(bookmark).to receive(:created).and_return(created) }

    before { expect(bookmark).to receive(:label).and_return('Random location') }

    before { expect(bookmark).to receive(:notes).and_return('This is a random location in space') }

    before { expect(bookmark).to receive(:location_id).and_return(30_003_430) }

    before { expect(bookmark).to receive(:creator_id).and_return(2_112_625_428) }

    before { expect(bookmark).to receive(:item_id).and_return(item_id) }

    before { expect(bookmark).to receive(:item_type_id).and_return(item_type_id) }

    before { expect(bookmark).to receive(:coordinate_x).and_return(coordinate_x) }

    before { expect(bookmark).to receive(:coordinate_y).and_return(coordinate_y) }

    before { expect(bookmark).to receive(:coordinate_z).and_return(coordinate_z) }

    subject { bookmark.as_json }

    its([:bookmark_id]) { should eq(4) }

    its([:folder_id]) { should eq(5) }

    its([:created]) { should eq(created) }

    its([:label]) { should eq('Random location') }

    its([:notes]) { should eq('This is a random location in space') }

    its([:location_id]) { should eq(30_003_430) }

    its([:creator_id]) { should eq(2_112_625_428) }

    its([:item_id]) { should eq(item_id) }

    its([:item_type_id]) { should eq(item_type_id) }

    its([:coordinate_x]) { should eq(coordinate_x) }

    its([:coordinate_y]) { should eq(coordinate_y) }

    its([:coordinate_z]) { should eq(coordinate_z) }
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

  describe '#item_id' do
    context 'when item is present' do
      let(:item) { double }

      before { expect(options).to receive(:[]).with('item').and_return(item).twice }

      before do
        #
        # options['item']['item_id']
        #
        expect(item).to receive(:[]).with('item_id')
      end

      specify { expect { subject.item_id }.not_to raise_error }
    end

    context 'when item not present' do
      before { expect(options).to receive(:[]).with('item').and_return(nil) }

      specify { expect { subject.item_id }.not_to raise_error }
    end
  end

  describe '#item_type_id' do
    context 'when item is present' do
      let(:item) { double }

      before { expect(options).to receive(:[]).with('item').and_return(item).twice }

      before do
        #
        # options['item']['type_id']
        #
        expect(item).to receive(:[]).with('type_id')
      end

      specify { expect { subject.item_type_id }.not_to raise_error }
    end

    context 'when item not present' do
      before { expect(options).to receive(:[]).with('item').and_return(nil) }

      specify { expect { subject.item_type_id }.not_to raise_error }
    end
  end

  describe '#coordinate_x' do
    context 'when coordinates is present' do
      let(:coordinates) { double }

      before { expect(options).to receive(:[]).with('coordinates').and_return(coordinates).twice }

      before do
        #
        # options['coordinates']['x']
        #
        expect(coordinates).to receive(:[]).with('x')
      end

      specify { expect { subject.coordinate_x }.not_to raise_error }
    end

    context 'when coordinates not present' do
      before { expect(options).to receive(:[]).with('coordinates').and_return(nil) }

      specify { expect { subject.coordinate_x }.not_to raise_error }
    end
  end

  describe '#coordinate_y' do
    context 'when coordinates is present' do
      let(:coordinates) { double }

      before { expect(options).to receive(:[]).with('coordinates').and_return(coordinates).twice }

      before do
        #
        # options['coordinates']['y']
        #
        expect(coordinates).to receive(:[]).with('y')
      end

      specify { expect { subject.coordinate_y }.not_to raise_error }
    end

    context 'when coordinates not present' do
      before { expect(options).to receive(:[]).with('coordinates').and_return(nil) }

      specify { expect { subject.coordinate_y }.not_to raise_error }
    end
  end

  describe '#coordinate_z' do
    context 'when coordinates is present' do
      let(:coordinates) { double }

      before { expect(options).to receive(:[]).with('coordinates').and_return(coordinates).twice }

      before do
        #
        # options['coordinates']['z']
        #
        expect(coordinates).to receive(:[]).with('z')
      end

      specify { expect { subject.coordinate_z }.not_to raise_error }
    end

    context 'when coordinates not present' do
      before { expect(options).to receive(:[]).with('coordinates').and_return(nil) }

      specify { expect { subject.coordinate_z }.not_to raise_error }
    end
  end
end
