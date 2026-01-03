# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Corporation do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:corporation) { described_class.new(options) }

    let(:description) { double }

    let(:date_founded) { double }

    let(:faction_id) { double }

    before { expect(corporation).to receive(:alliance_id).and_return(99_001_258) }

    before { expect(corporation).to receive(:ceo_id).and_return(1_721_864_142) }

    before { expect(corporation).to receive(:creator_id).and_return(1_721_864_142) }

    before { expect(corporation).to receive(:date_founded).and_return(date_founded) }

    before { expect(corporation).to receive(:description).and_return(description) }

    before { expect(corporation).to receive(:faction_id).and_return(faction_id) }

    before { expect(corporation).to receive(:home_station_id).and_return(60_011_893) }

    before { expect(corporation).to receive(:member_count).and_return(60) }

    before { expect(corporation).to receive(:name).and_return("Bullshit Bingo Club") }

    before { expect(corporation).to receive(:shares).and_return(1000) }

    before { expect(corporation).to receive(:tax_rate).and_return(0.1) }

    before { expect(corporation).to receive(:ticker).and_return("BUBIC") }

    before { expect(corporation).to receive(:corporation_url).and_return("http://") }

    before { expect(corporation).to receive(:war_eligible).and_return(true) }

    subject { corporation.as_json }

    its([:alliance_id]) { should eq(99_001_258) }

    its([:ceo_id]) { should eq(1_721_864_142) }

    its([:creator_id]) { should eq(1_721_864_142) }

    its([:date_founded]) { should eq(date_founded) }

    its([:description]) { should eq(description) }

    its([:faction_id]) { should eq(faction_id) }

    its([:home_station_id]) { should eq(60_011_893) }

    its([:member_count]) { should eq(60) }

    its([:name]) { should eq("Bullshit Bingo Club") }

    its([:shares]) { should eq(1000) }

    its([:tax_rate]) { should eq(0.1) }

    its([:ticker]) { should eq("BUBIC") }

    its([:corporation_url]) { should eq("http://") }

    its([:war_eligible]) { should eq(true) }
  end

  describe "#alliance_id" do
    before { expect(options).to receive(:[]).with("alliance_id") }

    specify { expect { subject.alliance_id }.not_to raise_error }
  end

  describe "#ceo_id" do
    before { expect(options).to receive(:[]).with("ceo_id") }

    specify { expect { subject.ceo_id }.not_to raise_error }
  end

  describe "#creator_id" do
    before { expect(options).to receive(:[]).with("creator_id") }

    specify { expect { subject.creator_id }.not_to raise_error }
  end

  describe "#date_founded" do
    context "when date_founded is present" do
      let(:date_founded) { double }

      before { expect(options).to receive(:[]).with("date_founded").and_return(date_founded) }

      before do
        #
        # subject.parse_datetime_with_timezone(date_founded)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(date_founded)
      end

      specify { expect { subject.date_founded }.not_to raise_error }
    end

    context "when date_founded not present" do
      before { expect(options).to receive(:[]).with("date_founded").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.date_founded }.not_to raise_error }
    end
  end

  describe "#description" do
    before { expect(options).to receive(:[]).with("description") }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe "#faction_id" do
    before { expect(options).to receive(:[]).with("faction_id") }

    specify { expect { subject.faction_id }.not_to raise_error }
  end

  describe "#home_station_id" do
    before { expect(options).to receive(:[]).with("home_station_id") }

    specify { expect { subject.home_station_id }.not_to raise_error }
  end

  describe "#member_count" do
    before { expect(options).to receive(:[]).with("member_count") }

    specify { expect { subject.member_count }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#shares" do
    before { expect(options).to receive(:[]).with("shares") }

    specify { expect { subject.shares }.not_to raise_error }
  end

  describe "#tax_rate" do
    before { expect(options).to receive(:[]).with("tax_rate") }

    specify { expect { subject.tax_rate }.not_to raise_error }
  end

  describe "#ticker" do
    before { expect(options).to receive(:[]).with("ticker") }

    specify { expect { subject.ticker }.not_to raise_error }
  end

  describe "#corporation_url" do
    before { expect(options).to receive(:[]).with("url") }

    specify { expect { subject.corporation_url }.not_to raise_error }
  end

  describe "#war_eligible" do
    before { expect(options).to receive(:[]).with("war_eligible") }

    specify { expect { subject.war_eligible }.not_to raise_error }
  end
end
