# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::BookmarkFolder do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:bookmark_folder) { described_class.new(options) }

    before { expect(bookmark_folder).to receive(:folder_id).and_return(5) }

    before { expect(bookmark_folder).to receive(:name).and_return("Icecream") }

    subject { bookmark_folder.as_json }

    its([:folder_id]) { should eq(5) }

    its([:name]) { should eq("Icecream") }
  end

  describe "#folder_id" do
    before { expect(options).to receive(:[]).with("folder_id") }

    specify { expect { subject.folder_id }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end
end
