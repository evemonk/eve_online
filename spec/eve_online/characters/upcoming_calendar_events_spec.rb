require 'spec_helper'

describe EveOnline::Characters::UpcomingCalendarEvents do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  let(:character_id) { 12_345_678 }

  subject { described_class.new(key_id, v_code, character_id) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/UpcomingCalendarEvents.xml.aspx') }

  describe '#initialize' do
    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }

    its(:character_id) { should eq(character_id) }
  end

  describe '#events' do
    context 'row is Hash' do
      let(:row) do
        {
          '@eventID' => '1234567',
          '@ownerID' => '87654321',
          '@ownerName' => 'MyCorp',
          '@eventDate' => '2015-12-26 04:37:22',
          '@eventTitle' => 'Control tower Name in 9-9999 goes off',
          '@duration' => '60',
          '@importance' => '0',
          '@response' => 'Undecided',
          '@eventText' => '<b>Minmatar Control Tower Small</b> will run out of fuel and go offline.',
          '@ownerTypeID' => '2'
        }
      end

      before do
        #
        # subject.row # => {"@eventID"=>"1234567", "@ownerID"=>"87654321", "@ownerName"=>"MyCorp", "@eventDate"=>"2015-12-26 04:37:22", "@eventTitle"=>"Control tower Name in 9-9999 goes off", "@duration"=>"60", "@importance"=>"0", "@response"=>"Undecided", "@eventText"=>"<b>Minmatar Control Tower Small</b> will run out of fuel and go offline.", "@ownerTypeID"=>"2"}
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::Event.new(row)
        #
        expect(EveOnline::Event).to receive(:new).with(row)
      end

      specify { expect { subject.events }.not_to raise_error }
    end

    context 'row is Array' do
      let(:row) do
        [
         {
           '@eventID' => '1234567',
           '@ownerID' => '87654321',
           '@ownerName' => 'MyCorp',
           '@eventDate' => '2015-12-26 04:37:22',
           '@eventTitle' => 'Control tower Name in 9-9999 goes off',
           '@duration' => '60',
           '@importance' => '0',
           '@response' => 'Undecided',
           '@eventText' => '<b>Minmatar Control Tower Small</b> will run out of fuel and go offline.',
           '@ownerTypeID' => '2'
         }
       ]
      end

      before do
        #
        # subject.row # => [{"@eventID"=>"1234567", "@ownerID"=>"87654321", "@ownerName"=>"MyCorp", "@eventDate"=>"2015-12-26 04:37:22", "@eventTitle"=>"Control tower Name in 9-9999 goes off", "@duration"=>"60", "@importance"=>"0", "@response"=>"Undecided", "@eventText"=>"<b>Minmatar Control Tower Small</b> will run out of fuel and go offline.", "@ownerTypeID"=>"2"}]
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::Event.new(row.first)
        #
        expect(EveOnline::Event).to receive(:new).with(row.first)
      end

      specify { expect { subject.events }.not_to raise_error }
    end

    context 'row is invalid' do
      before do
        #
        # subject.row # => 'invalid'
        #
        expect(subject).to receive(:row).and_return('invalid')
      end

      specify { expect { subject.events }.to raise_error(ArgumentError) }
    end
  end

  describe '#row' do
    before do
      #
      # subject.rowset.fetch('row')
      #
      expect(subject).to receive(:rowset) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('row')
        end
      end
    end

    specify { expect { subject.row }.not_to raise_error }
  end

  describe '#rowset' do
    before do
      #
      # subject.result.fetch('rowset')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('rowset')
        end
      end
    end

    specify { expect { subject.rowset }.not_to raise_error }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }")
    end
  end
end
