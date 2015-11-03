require 'spec_helper'
require 'nori'
require 'eve_online/base'

describe EveOnline::Base do
  describe '#url' do
    specify { expect { subject.url }.to raise_error(NotImplementedError) }
  end

  describe '#content' do
    let(:url) { 'https://google.com/' }

    before { expect(subject).to receive(:url).and_return(url) }

    before do
      #
      # subject.open(url).read
      #
      expect(subject).to receive(:open).with(url, open_timeout: 60, read_timeout: 60) do
        double.tap do |a|
          expect(a).to receive(:read)
        end
      end
    end

    specify { expect { subject.content }.not_to raise_error }
  end

  describe '#response' do
    let(:parser) { double('parser') }

    let(:content) { 'some xml content' }

    before { expect(subject).to receive(:content).and_return(content) }

    before { expect(subject).to receive(:parser).and_return(parser) }

    before { expect(parser).to receive(:parse).with(content) }

    specify { expect { subject.response }.not_to raise_error }
  end
end
