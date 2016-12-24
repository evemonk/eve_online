require 'spec_helper'

describe EveOnline::SDE::Base do
  specify { expect(described_class).to be_a(Memoist) }

  describe '#initialize' do
    let(:file) { double }

    subject { described_class.new(file) }

    its(:file) { should eq(file) }
  end

  describe '#content' do
    let(:file) { double }

    subject { described_class.new(file) }

    before { expect(File).to receive(:read).with(file) }

    specify { expect { subject.content }.not_to raise_error }

    specify { expect { subject.content }.to change { subject.instance_variable_defined?(:@_memoized_content) }.from(false).to(true) }
  end

  describe '#data' do
    let(:file) { double }

    let(:content) { double }

    subject { described_class.new(file) }

    before { expect(subject).to receive(:content).and_return(content) }

    before { expect(YAML).to receive(:load).with(content) }

    specify { expect { subject.data }.not_to raise_error }

    specify { expect { subject.data }.to change { subject.instance_variable_defined?(:@_memoized_data) }.from(false).to(true) }
  end
end
