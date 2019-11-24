# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::CharacterShip do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:model) { described_class.new(options) }

    before { expect(model).to receive(:ship_item_id).and_return(1_002_312_158_069) }

    before { expect(model).to receive(:ship_name).and_return("Green Black's Velator") }

    before { expect(model).to receive(:ship_type_id).and_return(606) }

    subject { model.as_json }

    its([:ship_item_id]) { should eq(1_002_312_158_069) }

    its([:ship_name]) { should eq("Green Black's Velator") }

    its([:ship_type_id]) { should eq(606) }
  end

  describe "#ship_item_id" do
    before { expect(options).to receive(:[]).with("ship_item_id") }

    specify { expect { subject.ship_item_id }.not_to raise_error }
  end

  describe "#ship_name" do
    before { expect(options).to receive(:[]).with("ship_name") }

    specify { expect { subject.ship_name }.not_to raise_error }
  end

  describe "#ship_type_id" do
    before { expect(options).to receive(:[]).with("ship_type_id") }

    specify { expect { subject.ship_type_id }.not_to raise_error }
  end
end
