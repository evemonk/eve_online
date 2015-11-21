require 'spec_helper'

describe EveOnline::Character::CalendarEventAttendees do
  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/CalendarEventAttendees.xml.aspx') }
end
