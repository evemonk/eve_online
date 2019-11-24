# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::CorporationIndustryJob do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:industry_job) { described_class.new(options) }

    let(:completed_character_id) { double }

    let(:completed_date) { double }

    let(:end_date) { double }

    let(:pause_date) { double }

    let(:start_date) { double }

    let(:successful_runs) { double }

    before { expect(industry_job).to receive(:activity_id).and_return(5) }

    before { expect(industry_job).to receive(:blueprint_id).and_return(1_024_839_597_103) }

    before { expect(industry_job).to receive(:blueprint_location_id).and_return(1_023_579_231_924) }

    before { expect(industry_job).to receive(:blueprint_type_id).and_return(28_607) }

    before { expect(industry_job).to receive(:completed_character_id).and_return(completed_character_id) }

    before { expect(industry_job).to receive(:completed_date).and_return(completed_date) }

    before { expect(industry_job).to receive(:cost).and_return(902_034.0) }

    before { expect(industry_job).to receive(:duration).and_return(625_697) }

    before { expect(industry_job).to receive(:end_date).and_return(end_date) }

    before { expect(industry_job).to receive(:facility_id).and_return(1_023_579_231_924) }

    before { expect(industry_job).to receive(:installer_id).and_return(93_997_721) }

    before { expect(industry_job).to receive(:job_id).and_return(344_732_396) }

    before { expect(industry_job).to receive(:licensed_runs).and_return(1) }

    before { expect(industry_job).to receive(:location_id).and_return(60_006_382) }

    before { expect(industry_job).to receive(:output_location_id).and_return(1_023_579_231_924) }

    before { expect(industry_job).to receive(:pause_date).and_return(pause_date) }

    before { expect(industry_job).to receive(:probability).and_return(1.0) }

    before { expect(industry_job).to receive(:product_type_id).and_return(28_607) }

    before { expect(industry_job).to receive(:runs).and_return(2) }

    before { expect(industry_job).to receive(:start_date).and_return(start_date) }

    before { expect(industry_job).to receive(:status).and_return("active") }

    before { expect(industry_job).to receive(:successful_runs).and_return(successful_runs) }

    subject { industry_job.as_json }

    its([:activity_id]) { should eq(5) }

    its([:blueprint_id]) { should eq(1_024_839_597_103) }

    its([:blueprint_location_id]) { should eq(1_023_579_231_924) }

    its([:blueprint_type_id]) { should eq(28_607) }

    its([:completed_character_id]) { should eq(completed_character_id) }

    its([:completed_date]) { should eq(completed_date) }

    its([:cost]) { should eq(902_034.0) }

    its([:duration]) { should eq(625_697) }

    its([:end_date]) { should eq(end_date) }

    its([:facility_id]) { should eq(1_023_579_231_924) }

    its([:installer_id]) { should eq(93_997_721) }

    its([:job_id]) { should eq(344_732_396) }

    its([:licensed_runs]) { should eq(1) }

    its([:location_id]) { should eq(60_006_382) }

    its([:output_location_id]) { should eq(1_023_579_231_924) }

    its([:pause_date]) { should eq(pause_date) }

    its([:probability]) { should eq(1.0) }

    its([:product_type_id]) { should eq(28_607) }

    its([:runs]) { should eq(2) }

    its([:start_date]) { should eq(start_date) }

    its([:status]) { should eq("active") }

    its([:successful_runs]) { should eq(successful_runs) }
  end

  describe "#activity_id" do
    before { expect(options).to receive(:[]).with("activity_id") }

    specify { expect { subject.activity_id }.not_to raise_error }
  end

  describe "#blueprint_id" do
    before { expect(options).to receive(:[]).with("blueprint_id") }

    specify { expect { subject.blueprint_id }.not_to raise_error }
  end

  describe "#blueprint_location_id" do
    before { expect(options).to receive(:[]).with("blueprint_location_id") }

    specify { expect { subject.blueprint_location_id }.not_to raise_error }
  end

  describe "#blueprint_type_id" do
    before { expect(options).to receive(:[]).with("blueprint_type_id") }

    specify { expect { subject.blueprint_type_id }.not_to raise_error }
  end

  describe "#completed_character_id" do
    before { expect(options).to receive(:[]).with("completed_character_id") }

    specify { expect { subject.completed_character_id }.not_to raise_error }
  end

  describe "#completed_date" do
    context "when completed_date is present" do
      let(:completed_date) { double }

      before { expect(options).to receive(:[]).with("completed_date").and_return(completed_date) }

      before do
        #
        # subject.parse_datetime_with_timezone(completed_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(completed_date)
      end

      specify { expect { subject.completed_date }.not_to raise_error }
    end

    context "when completed_date not present" do
      before { expect(options).to receive(:[]).with("completed_date").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.completed_date }.not_to raise_error }
    end
  end

  describe "#cost" do
    before { expect(options).to receive(:[]).with("cost") }

    specify { expect { subject.cost }.not_to raise_error }
  end

  describe "#duration" do
    before { expect(options).to receive(:[]).with("duration") }

    specify { expect { subject.duration }.not_to raise_error }
  end

  describe "#end_date" do
    context "when end_date is present" do
      let(:end_date) { double }

      before { expect(options).to receive(:[]).with("end_date").and_return(end_date) }

      before do
        #
        # subject.parse_datetime_with_timezone(end_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(end_date)
      end

      specify { expect { subject.end_date }.not_to raise_error }
    end

    context "when end_date not present" do
      before { expect(options).to receive(:[]).with("end_date").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.end_date }.not_to raise_error }
    end
  end

  describe "#facility_id" do
    before { expect(options).to receive(:[]).with("facility_id") }

    specify { expect { subject.facility_id }.not_to raise_error }
  end

  describe "#installer_id" do
    before { expect(options).to receive(:[]).with("installer_id") }

    specify { expect { subject.installer_id }.not_to raise_error }
  end

  describe "#job_id" do
    before { expect(options).to receive(:[]).with("job_id") }

    specify { expect { subject.job_id }.not_to raise_error }
  end

  describe "#licensed_runs" do
    before { expect(options).to receive(:[]).with("licensed_runs") }

    specify { expect { subject.licensed_runs }.not_to raise_error }
  end

  describe "#location_id" do
    before { expect(options).to receive(:[]).with("location_id") }

    specify { expect { subject.location_id }.not_to raise_error }
  end

  describe "#output_location_id" do
    before { expect(options).to receive(:[]).with("output_location_id") }

    specify { expect { subject.output_location_id }.not_to raise_error }
  end

  describe "#pause_date" do
    context "when pause_date is present" do
      let(:pause_date) { double }

      before { expect(options).to receive(:[]).with("pause_date").and_return(pause_date) }

      before do
        #
        # subject.parse_datetime_with_timezone(pause_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(pause_date)
      end

      specify { expect { subject.pause_date }.not_to raise_error }
    end

    context "when pause_date not present" do
      before { expect(options).to receive(:[]).with("pause_date").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.pause_date }.not_to raise_error }
    end
  end

  describe "#probability" do
    before { expect(options).to receive(:[]).with("probability") }

    specify { expect { subject.probability }.not_to raise_error }
  end

  describe "#product_type_id" do
    before { expect(options).to receive(:[]).with("product_type_id") }

    specify { expect { subject.product_type_id }.not_to raise_error }
  end

  describe "#runs" do
    before { expect(options).to receive(:[]).with("runs") }

    specify { expect { subject.runs }.not_to raise_error }
  end

  describe "#start_date" do
    context "when start_date is present" do
      let(:start_date) { double }

      before { expect(options).to receive(:[]).with("start_date").and_return(start_date) }

      before do
        #
        # subject.parse_datetime_with_timezone(start_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(start_date)
      end

      specify { expect { subject.start_date }.not_to raise_error }
    end

    context "when start_date not present" do
      before { expect(options).to receive(:[]).with("start_date").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.start_date }.not_to raise_error }
    end
  end

  describe "#status" do
    before { expect(options).to receive(:[]).with("status") }

    specify { expect { subject.status }.not_to raise_error }
  end

  describe "#successful_runs" do
    before { expect(options).to receive(:[]).with("successful_runs") }

    specify { expect { subject.successful_runs }.not_to raise_error }
  end
end
