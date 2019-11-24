# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Category do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:category) { described_class.new(options) }

    before { expect(category).to receive(:category_id).and_return(6) }

    before { expect(category).to receive(:name).and_return("Ship") }

    before { expect(category).to receive(:published).and_return(true) }

    subject { category.as_json }

    its([:category_id]) { should eq(6) }

    its([:name]) { should eq("Ship") }

    its([:published]) { should eq(true) }
  end

  describe "#category_id" do
    before { expect(options).to receive(:[]).with("category_id") }

    specify { expect { subject.category_id }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#published" do
    before { expect(options).to receive(:[]).with("published") }

    specify { expect { subject.published }.not_to raise_error }
  end

  describe "#group_ids" do
    before { expect(options).to receive(:[]).with("groups") }

    specify { expect { subject.group_ids }.not_to raise_error }
  end
end
