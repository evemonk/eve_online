# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::MailLabel do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:label) { described_class.new(options) }

    before { expect(label).to receive(:color).and_return("#ffffff") }

    before { expect(label).to receive(:label_id).and_return(8) }

    before { expect(label).to receive(:name).and_return("[Alliance]") }

    before { expect(label).to receive(:unread_count).and_return(0) }

    subject { label.as_json }

    its([:color]) { should eq("#ffffff") }

    its([:label_id]) { should eq(8) }

    its([:name]) { should eq("[Alliance]") }

    its([:unread_count]) { should eq(0) }
  end

  describe "#color" do
    before { expect(options).to receive(:[]).with("color") }

    specify { expect { subject.color }.not_to raise_error }
  end

  describe "#label_id" do
    before { expect(options).to receive(:[]).with("label_id") }

    specify { expect { subject.label_id }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#unread_count" do
    before { expect(options).to receive(:[]).with("unread_count") }

    specify { expect { subject.unread_count }.not_to raise_error }
  end
end
