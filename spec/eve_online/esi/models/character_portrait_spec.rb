# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::CharacterPortrait do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:character_portrait) { described_class.new(options) }

    before { expect(character_portrait).to receive(:medium).and_return("http://image.eveonline.com/Character/90729314_128.jpg") }

    before { expect(character_portrait).to receive(:large).and_return("http://image.eveonline.com/Character/90729314_256.jpg") }

    before { expect(character_portrait).to receive(:huge).and_return("http://image.eveonline.com/Character/90729314_512.jpg") }

    before { expect(character_portrait).to receive(:small).and_return("http://image.eveonline.com/Character/90729314_64.jpg") }

    subject { character_portrait.as_json }

    its([:medium]) { should eq("http://image.eveonline.com/Character/90729314_128.jpg") }

    its([:large]) { should eq("http://image.eveonline.com/Character/90729314_256.jpg") }

    its([:huge]) { should eq("http://image.eveonline.com/Character/90729314_512.jpg") }

    its([:small]) { should eq("http://image.eveonline.com/Character/90729314_64.jpg") }
  end

  describe "#medium" do
    before { expect(options).to receive(:[]).with("px128x128") }

    specify { expect { subject.medium }.not_to raise_error }
  end

  describe "#large" do
    before { expect(options).to receive(:[]).with("px256x256") }

    specify { expect { subject.large }.not_to raise_error }
  end

  describe "#huge" do
    before { expect(options).to receive(:[]).with("px512x512") }

    specify { expect { subject.huge }.not_to raise_error }
  end

  describe "#small" do
    before { expect(options).to receive(:[]).with("px64x64") }

    specify { expect { subject.small }.not_to raise_error }
  end
end
