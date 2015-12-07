require 'spec_helper'

describe EveOnline::Characters::CalendarEventAttendees do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  let(:character_id) { 12345678 }

  let(:event_id) { 1259522 }

  subject { described_class.new(key_id, v_code, character_id, event_id) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/CalendarEventAttendees.xml.aspx') }

  describe '#initialize' do
    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }

    its(:character_id) { should eq(character_id) }

    its(:event_id) { should eq(event_id) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&eventIDs=#{ event_id }")
    end
  end
end
