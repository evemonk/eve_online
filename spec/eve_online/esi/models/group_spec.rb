# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Group do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:group) { described_class.new(options) }

    before { expect(group).to receive(:category_id).and_return(25) }

    before { expect(group).to receive(:group_id).and_return(450) }

    before { expect(group).to receive(:name).and_return("Arkonor") }

    before { expect(group).to receive(:published).and_return(true) }

    subject { group.as_json }

    its([:category_id]) { should eq(25) }

    its([:group_id]) { should eq(450) }

    its([:name]) { should eq("Arkonor") }

    its([:published]) { should eq(true) }
  end

  describe "#category_id" do
    before { expect(options).to receive(:[]).with("category_id") }

    specify { expect { subject.category_id }.not_to raise_error }
  end

  describe "#group_id" do
    before { expect(options).to receive(:[]).with("group_id") }

    specify { expect { subject.group_id }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#published" do
    before { expect(options).to receive(:[]).with("published") }

    specify { expect { subject.published }.not_to raise_error }
  end

  describe "#type_ids" do
    before { expect(options).to receive(:[]).with("types") }

    specify { expect { subject.type_ids }.not_to raise_error }
  end
end
