# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Models::DogmaEffect do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    # TODO: write
  end

  describe '#description' do
    before { expect(options).to receive(:[]).with('description') }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe '#disallow_auto_repeat' do
    before { expect(options).to receive(:[]).with('disallow_auto_repeat') }

    specify { expect { subject.disallow_auto_repeat }.not_to raise_error }
  end

  describe '#discharge_attribute_id' do
    before { expect(options).to receive(:[]).with('discharge_attribute_id') }

    specify { expect { subject.discharge_attribute_id }.not_to raise_error }
  end

  describe '#display_name' do
    before { expect(options).to receive(:[]).with('display_name') }

    specify { expect { subject.display_name }.not_to raise_error }
  end

  describe '#duration_attribute_id' do
    before { expect(options).to receive(:[]).with('duration_attribute_id') }

    specify { expect { subject.duration_attribute_id }.not_to raise_error }
  end

  describe '#effect_category' do
    before { expect(options).to receive(:[]).with('effect_category') }

    specify { expect { subject.effect_category }.not_to raise_error }
  end

  describe '#effect_id' do
    before { expect(options).to receive(:[]).with('effect_id') }

    specify { expect { subject.effect_id }.not_to raise_error }
  end

  describe '#electronic_chance' do
    before { expect(options).to receive(:[]).with('electronic_chance') }

    specify { expect { subject.electronic_chance }.not_to raise_error }
  end

  describe '#falloff_attribute_id' do
    before { expect(options).to receive(:[]).with('falloff_attribute_id') }

    specify { expect { subject.falloff_attribute_id }.not_to raise_error }
  end

  describe '#falloff_attribute_id' do
    before { expect(options).to receive(:[]).with('falloff_attribute_id') }

    specify { expect { subject.falloff_attribute_id }.not_to raise_error }
  end

  describe '#icon_id' do
    before { expect(options).to receive(:[]).with('icon_id') }

    specify { expect { subject.icon_id }.not_to raise_error }
  end

  describe '#is_assistance' do
    before { expect(options).to receive(:[]).with('is_assistance') }

    specify { expect { subject.is_assistance }.not_to raise_error }
  end

  describe '#is_offensive' do
    before { expect(options).to receive(:[]).with('is_offensive') }

    specify { expect { subject.is_offensive }.not_to raise_error }
  end

  describe '#is_warp_safe' do
    before { expect(options).to receive(:[]).with('is_warp_safe') }

    specify { expect { subject.is_warp_safe }.not_to raise_error }
  end

  describe '#name' do
    before { expect(options).to receive(:[]).with('name') }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe '#post_expression' do
    before { expect(options).to receive(:[]).with('post_expression') }

    specify { expect { subject.post_expression }.not_to raise_error }
  end

  describe '#pre_expression' do
    before { expect(options).to receive(:[]).with('pre_expression') }

    specify { expect { subject.pre_expression }.not_to raise_error }
  end

  describe '#published' do
    before { expect(options).to receive(:[]).with('published') }

    specify { expect { subject.published }.not_to raise_error }
  end

  describe '#range_attribute_id' do
    before { expect(options).to receive(:[]).with('range_attribute_id') }

    specify { expect { subject.range_attribute_id }.not_to raise_error }
  end

  describe '#range_chance' do
    before { expect(options).to receive(:[]).with('range_chance') }

    specify { expect { subject.range_chance }.not_to raise_error }
  end

  describe '#tracking_speed_attribute_id' do
    before { expect(options).to receive(:[]).with('tracking_speed_attribute_id') }

    specify { expect { subject.tracking_speed_attribute_id }.not_to raise_error }
  end

  describe '#modifiers' do
    specify { expect(subject.modifiers).to eq(nil) }
  end
end
