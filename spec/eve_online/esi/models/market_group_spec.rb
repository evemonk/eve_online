# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::MarketGroup do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:market_group) { described_class.new(options) }

    let(:date) { double }

    before { expect(market_group).to receive(:description).and_return("Implants intended for Subcervical Processing Slot 1.") }

    before { expect(market_group).to receive(:market_group_id).and_return(618) }

    before { expect(market_group).to receive(:name).and_return("Implant Slot 01") }

    before { expect(market_group).to receive(:parent_group_id).and_return(532) }

    subject { market_group.as_json }

    its([:description]) { should eq("Implants intended for Subcervical Processing Slot 1.") }

    its([:market_group_id]) { should eq(618) }

    its([:name]) { should eq("Implant Slot 01") }

    its([:parent_group_id]) { should eq(532) }
  end

  describe "#description" do
    before { expect(options).to receive(:[]).with("description") }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe "#market_group_id" do
    before { expect(options).to receive(:[]).with("market_group_id") }

    specify { expect { subject.market_group_id }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#parent_group_id" do
    before { expect(options).to receive(:[]).with("parent_group_id") }

    specify { expect { subject.parent_group_id }.not_to raise_error }
  end

  describe "#type_ids" do
    before { expect(options).to receive(:[]).with("types") }

    specify { expect { subject.type_ids }.not_to raise_error }
  end
end
