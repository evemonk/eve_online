# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Graphic do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:graphic) { described_class.new(options) }

    let(:collision_file) { double }

    let(:graphic_file) { double }

    let(:graphic_id) { double }

    let(:icon_folder) { double }

    let(:sof_dna) { double }

    let(:sof_fation_name) { double }

    let(:sof_hull_name) { double }

    let(:sof_race_name) { double }

    before { expect(graphic).to receive(:collision_file).and_return(collision_file) }

    before { expect(graphic).to receive(:graphic_file).and_return(graphic_file) }

    before { expect(graphic).to receive(:graphic_id).and_return(graphic_id) }

    before { expect(graphic).to receive(:icon_folder).and_return(icon_folder) }

    before { expect(graphic).to receive(:sof_dna).and_return(sof_dna) }

    before { expect(graphic).to receive(:sof_fation_name).and_return(sof_fation_name) }

    before { expect(graphic).to receive(:sof_hull_name).and_return(sof_hull_name) }

    before { expect(graphic).to receive(:sof_race_name).and_return(sof_race_name) }

    subject { graphic.as_json }

    its([:collision_file]) { should eq(collision_file) }

    its([:graphic_file]) { should eq(graphic_file) }

    its([:graphic_id]) { should eq(graphic_id) }

    its([:icon_folder]) { should eq(icon_folder) }

    its([:sof_dna]) { should eq(sof_dna) }

    its([:sof_fation_name]) { should eq(sof_fation_name) }

    its([:sof_hull_name]) { should eq(sof_hull_name) }

    its([:sof_race_name]) { should eq(sof_race_name) }
  end

  describe "#collision_file" do
    before { expect(options).to receive(:[]).with("collision_file") }

    specify { expect { subject.collision_file }.not_to raise_error }
  end

  describe "#graphic_file" do
    before { expect(options).to receive(:[]).with("graphic_file") }

    specify { expect { subject.graphic_file }.not_to raise_error }
  end

  describe "#graphic_id" do
    before { expect(options).to receive(:[]).with("graphic_id") }

    specify { expect { subject.graphic_id }.not_to raise_error }
  end

  describe "#icon_folder" do
    before { expect(options).to receive(:[]).with("icon_folder") }

    specify { expect { subject.icon_folder }.not_to raise_error }
  end

  describe "#sof_dna" do
    before { expect(options).to receive(:[]).with("sof_dna") }

    specify { expect { subject.sof_dna }.not_to raise_error }
  end

  describe "#sof_fation_name" do
    before { expect(options).to receive(:[]).with("sof_fation_name") }

    specify { expect { subject.sof_fation_name }.not_to raise_error }
  end

  describe "#sof_hull_name" do
    before { expect(options).to receive(:[]).with("sof_hull_name") }

    specify { expect { subject.sof_hull_name }.not_to raise_error }
  end

  describe "#sof_race_name" do
    before { expect(options).to receive(:[]).with("sof_race_name") }

    specify { expect { subject.sof_race_name }.not_to raise_error }
  end
end
