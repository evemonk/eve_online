# frozen_string_literal: true

require "spec_helper"

describe EveOnline::Formulas::BlueprintCopyTime do
  # 240 seconds it time to copy e.g. "Acolyte I Blueprint"
  let(:seconds) { 240 }

  let(:science_level) { 5 }

  let(:advanced_industry_level) { 1 }

  let(:science_copy_speed_bonus_per_level) { -5.00  }

  let(:advanced_industry_skill_industry_job_time_bonus_per_level) { -3.00 }

  subject do
    described_class.new(seconds, science_level,
                        advanced_industry_level,
                        science_copy_speed_bonus_per_level,
                        advanced_industry_skill_industry_job_time_bonus_per_level)
  end

  describe "#initialize" do
    context "without runs" do
      its(:seconds) { should eq(seconds) }

      its(:science_level) { should eq(science_level) }

      its(:advanced_industry_level) { should eq(advanced_industry_level) }

      its(:science_copy_speed_bonus_per_level) { should eq(science_copy_speed_bonus_per_level) }

      its(:advanced_industry_skill_industry_job_time_bonus_per_level) { should eq(advanced_industry_skill_industry_job_time_bonus_per_level) }

      its(:runs) { should eq(1) }
    end

    context "with runs" do
      subject do
        described_class.new(seconds, science_level,
                            advanced_industry_level,
                            science_copy_speed_bonus_per_level,
                            advanced_industry_skill_industry_job_time_bonus_per_level,
                            5)
      end

      its(:runs) { should eq(5) }
    end
  end

  describe "#time" do
    # TODO: check why?
    specify { expect(subject.time.round(1)).to eq(174.6) }

    specify { expect(subject.time).to eq(174.60000000000002) }
  end

  describe "#time_modifier" do
    specify { expect(subject.time_modifier).to eq(0.7275) }
  end

  describe "#science_copy_bonus" do
    specify { expect(subject.science_copy_bonus).to eq(-25.0) }
  end

  describe "#science_copy_bonus_time_modifier" do
    specify { expect(subject.science_copy_bonus_time_modifier).to eq(0.75) }
  end

  describe "#advanced_industry_job_time_bonus" do
    specify { expect(subject.advanced_industry_job_time_bonus).to eq(-3.0) }
  end

  describe "#advanced_industry_job_time_bonus_time_modifier" do
    specify { expect(subject.advanced_industry_job_time_bonus_time_modifier).to eq(0.97) }
  end
end
