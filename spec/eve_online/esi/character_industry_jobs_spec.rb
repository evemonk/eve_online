# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterIndustryJobs do
  let(:options) { {token: "token123", character_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/characters/%<character_id>s/industry/jobs/") }

  describe "#initialize" do
    context "with token and character_id" do
      let(:options) { {token: "token123", character_id: 12_345_678} }

      its(:token) { should eq("token123") }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      its(:_write_timeout) { should eq(60) }

      its(:character_id) { should eq(12_345_678) }

      its(:include_completed) { should eq(nil) }
    end

    context "with include completed" do
      let(:options) { {token: "token123", character_id: 12_345_678, include_completed: true} }

      its(:include_completed) { should eq(true) }
    end

    context "without include completed" do
      let(:options) { {token: "token123", character_id: 12_345_678, include_completed: false} }

      its(:include_completed) { should eq(false) }
    end
  end

  describe "#jobs" do
    context "when @jobs set" do
      let(:jobs) { [instance_double(EveOnline::ESI::Models::CharacterIndustryJob)] }

      before { subject.instance_variable_set(:@jobs, jobs) }

      specify { expect(subject.jobs).to eq(jobs) }
    end

    context "when @jobs not set" do
      let(:job) { instance_double(EveOnline::ESI::Models::CharacterIndustryJob) }

      let(:response) do
        [
          {
            job_id: 229_136_101,
            installer_id: 498_338_451,
            facility_id: 60_006_382,
            location_id: 60_006_382,
            activity_id: 1,
            blueprint_id: 1_015_116_533_326,
            blueprint_type_id: 2047,
            blueprint_location_id: 60_006_382,
            output_location_id: 60_006_382,
            runs: 1,
            cost: 118,
            licensed_runs: 200,
            status: "active",
            duration: 548,
            start_date: "2014-07-19T15:47:06Z",
            end_date: "2014-07-19T15:56:14Z"
          }
        ]
      end

      before do
        #
        # subject.response # => [{"job_id"=>229136101, "installer_id"=>498338451, "facility_id"=>60006382, "location_id"=> 60006382, "activity_id"=>1, "blueprint_id"=>1015116533326, "blueprint_type_id"=>2047, "blueprint_location_id"=>60006382, "output_location_id"=>60006382, "runs"=>1, "cost"=>118, "licensed_runs"=>200, "status"=>"active", "duration"=>548, "start_date"=>"2014-07-19T15:47:06Z", "end_date"=>"2014-07-19T15:56:14Z"}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::CharacterIndustryJob.new(response.first) # => job
        #
        expect(EveOnline::ESI::Models::CharacterIndustryJob).to receive(:new).with(response.first).and_return(job)
      end

      specify { expect(subject.jobs).to eq([job]) }

      specify { expect { subject.jobs }.to change { subject.instance_variable_get(:@jobs) }.from(nil).to([job]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-industry.read_character_jobs.v1") }
  end

  describe "#additional_query_params" do
    specify { expect(subject.additional_query_params).to eq([:include_completed]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/characters/12345678/industry/jobs/")
    end
  end

  describe "#query" do
    context "without include_completed" do
      specify do
        expect(subject.query).to eq({})
      end
    end

    context "with include_completed" do
      let(:options) do
        {
          token: "token123",
          character_id: 12_345_678,
          include_completed: true
        }
      end

      subject { described_class.new(options) }

      specify do
        expect(subject.query).to eq(include_completed: true)
      end
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/characters/12345678/industry/jobs/")
    end
  end
end
