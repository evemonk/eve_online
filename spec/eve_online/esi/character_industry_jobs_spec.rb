require 'spec_helper'

describe EveOnline::ESI::CharacterIndustryJobs do
  let(:options) { { token: 'token123', character_id: 12_345_678, include_completed: false } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v1/characters/%<character_id>s/industry/jobs/?datasource=tranquility&include_completed=%<include_completed>s') }

  describe '#initialize' do
    its(:token) { should eq('token123') }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(12_345_678) }

    context 'with include completed' do
      its(:include_completed) { should eq(false) }
    end

    context 'without include completed' do
      let(:options) { { token: 'token123', character_id: 12_345_678, include_completed: true } }

      its(:include_completed) { should eq(true) }
    end
  end

  describe '#jobs' do
    let(:job) { double }

    let(:response) do
      [
        {
          'job_id' => 229_136_101,
          'installer_id' => 498_338_451,
          'facility_id' => 60_006_382,
          'location_id' => 60_006_382,
          'activity_id' => 1,
          'blueprint_id' => 1_015_116_533_326,
          'blueprint_type_id' => 2047,
          'blueprint_location_id' => 60_006_382,
          'output_location_id' => 60_006_382,
          'runs' => 1,
          'cost' => 118,
          'licensed_runs' => 200,
          'status' => 'active',
          'duration' => 548,
          'start_date' => '2014-07-19T15:47:06Z',
          'end_date' => '2014-07-19T15:56:14Z'
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
      # EveOnline::ESI::Models::IndustryJob.new(response.first) # => job
      #
      expect(EveOnline::ESI::Models::IndustryJob).to receive(:new).with(response.first).and_return(job)
    end

    specify { expect(subject.jobs).to eq([job]) }

    specify { expect { subject.jobs }.to change { subject.instance_variable_defined?(:@_memoized_jobs) }.from(false).to(true) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-industry.read_character_jobs.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v1/characters/12345678/industry/jobs/?datasource=tranquility&include_completed=false')
    end
  end
end
