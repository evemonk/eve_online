# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Ancestry do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:ancestry) { described_class.new(options) }

    before { expect(ancestry).to receive(:bloodline_id).and_return(4) }

    before { expect(ancestry).to receive(:description).and_return("Millions of slaves within the Amarr Empire dream of escape...") }

    before { expect(ancestry).to receive(:icon_id).and_return(1664) }

    before { expect(ancestry).to receive(:ancestry_id).and_return(24) }

    before { expect(ancestry).to receive(:name).and_return("Slave Child") }

    before { expect(ancestry).to receive(:short_description).and_return("Torn from the cold and brought to the warmth of a new life.") }

    subject { ancestry.as_json }

    its([:bloodline_id]) { should eq(4) }

    its([:description]) { should eq("Millions of slaves within the Amarr Empire dream of escape...") }

    its([:icon_id]) { should eq(1664) }

    its([:ancestry_id]) { should eq(24) }

    its([:name]) { should eq("Slave Child") }

    its([:short_description]) { should eq("Torn from the cold and brought to the warmth of a new life.") }
  end

  describe "#bloodline_id" do
    before { expect(options).to receive(:[]).with("bloodline_id") }

    specify { expect { subject.bloodline_id }.not_to raise_error }
  end

  describe "#description" do
    before { expect(options).to receive(:[]).with("description") }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe "#icon_id" do
    before { expect(options).to receive(:[]).with("icon_id") }

    specify { expect { subject.icon_id }.not_to raise_error }
  end

  describe "#ancestry_id" do
    before { expect(options).to receive(:[]).with("id") }

    specify { expect { subject.ancestry_id }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#short_description" do
    before { expect(options).to receive(:[]).with("short_description") }

    specify { expect { subject.short_description }.not_to raise_error }
  end
end
