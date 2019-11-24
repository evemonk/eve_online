# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::JumpClone do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:jump_clone) { described_class.new(options) }

    let(:name) { double }

    before { expect(jump_clone).to receive(:jump_clone_id).and_return(22_357_400) }

    before { expect(jump_clone).to receive(:location_id).and_return(61_000_032) }

    before { expect(jump_clone).to receive(:location_type).and_return("station") }

    before { expect(jump_clone).to receive(:name).and_return(name) }

    subject { jump_clone.as_json }

    its([:jump_clone_id]) { should eq(22_357_400) }

    its([:location_id]) { should eq(61_000_032) }

    its([:location_type]) { should eq("station") }

    its([:name]) { should eq(name) }
  end

  describe "#implant_ids" do
    before { expect(options).to receive(:[]).with("implants") }

    specify { expect { subject.implant_ids }.not_to raise_error }
  end

  describe "#jump_clone_id" do
    before { expect(options).to receive(:[]).with("jump_clone_id") }

    specify { expect { subject.jump_clone_id }.not_to raise_error }
  end

  describe "#location_id" do
    before { expect(options).to receive(:[]).with("location_id") }

    specify { expect { subject.location_id }.not_to raise_error }
  end

  describe "#location_type" do
    before { expect(options).to receive(:[]).with("location_type") }

    specify { expect { subject.location_type }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end
end
