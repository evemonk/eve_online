# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::UniverseAncestries do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v1/universe/ancestries/?datasource=%<datasource>s') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:datasource) { should eq('tranquility') }
  end

  describe '#ancestries' do
    context 'when @ancestries set' do
      let(:ancestries) { [instance_double(EveOnline::ESI::Models::Ancestry)] }

      before { subject.instance_variable_set(:@ancestries, ancestries) }

      specify { expect(subject.ancestries).to eq(ancestries) }
    end

    context 'when @ancestries not set' do
      let(:ancestry) { instance_double(EveOnline::ESI::Models::Ancestry) }

      let(:response) do
        [
          {
            'id' => 24,
            'name' => 'Slave Child',
            'bloodline_id' => 4,
            'description' => 'Millions of slaves within the Amarr Empire dream of escape...',
            'short_description' => 'Torn from the cold and brought to the warmth of a new life.',
            'icon_id' => 1664
          }
        ]
      end

      before do
        #
        # subject.response # => [{"id"=>24, "name"=>"Slave Child", "bloodline_id"=>4, "description"=>"Millions of slaves within the Amarr Empire dream of escape...", "short_description"=>"Torn from the cold and brought to the warmth of a new life.", "icon_id"=>1664}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::Ancestry.new(response.first) # => ancestry
        #
        expect(EveOnline::ESI::Models::Ancestry).to receive(:new).with(response.first).and_return(ancestry)
      end

      specify { expect(subject.ancestries).to eq([ancestry]) }

      specify { expect { subject.ancestries }.to change { subject.instance_variable_get(:@ancestries) }.from(nil).to([ancestry]) }
    end
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v1/universe/ancestries/?datasource=tranquility')
    end
  end
end
