require 'spec_helper'

describe EveOnline::Characters::Standings do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  let(:character_id) { 12_345_678 }

  subject { described_class.new(key_id, v_code, character_id) }

  specify { expect(subject).to be_a(EveOnline::BaseXML) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/Standings.xml.aspx') }

  specify { expect(described_class::ACCESS_MASK).to eq(524_288) }

  describe '#initialize' do
    let(:parser) { double }

    before do
      #
      # Nori.new(advanced_typecasting: false) => double
      #
      expect(Nori).to receive(:new).with(advanced_typecasting: false).and_return(parser)
    end

    its(:parser) { should eq(parser) }

    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }

    its(:character_id) { should eq(character_id) }
  end

  describe '#agents' do
    let(:agent) { double }

    let(:rowset) do
      [
        {
          '@fromID' => '3008771',
          '@fromName' => 'Nehrnah Gorouyar',
          '@standing' => '0.12'
        }
      ]
    end

    before do
      #
      # subject.agents_rowset # => [{"@fromID"=>"3008771", "@fromName"=>"Nehrnah Gorouyar", "@standing"=>"0.12"}]
      #
      expect(subject).to receive(:agents_rowset).and_return(rowset)
    end

    before do
      #
      # EveOnline::Standing.new(rowset.first) # => agent
      #
      expect(EveOnline::Standing).to receive(:new).with(rowset.first).and_return(agent)
    end

    specify { expect(subject.agents).to eq([agent]) }

    specify { expect { subject.agents }.to change { subject.instance_variable_defined?(:@_memoized_agents) }.from(false).to(true) }
  end

  describe '#npc_corporations' do
    let(:npc_corporation) { double }

    let(:rowset) do
      [
        {
          '@fromID' => '1000035',
          '@fromName' => 'Caldari Navy',
          '@standing' => '0.72'
        }
      ]
    end

    before do
      #
      # subject.npc_corporations_rowset # => [{"@fromID"=>"1000035", "@fromName"=>"Caldari Navy", "@standing"=>"0.72"}]
      #
      expect(subject).to receive(:npc_corporations_rowset).and_return(rowset)
    end

    before do
      #
      # EveOnline::Standing.new(rowset.first) # => npc_corporation
      #
      expect(EveOnline::Standing).to receive(:new).with(rowset.first).and_return(npc_corporation)
    end

    specify { expect(subject.npc_corporations).to eq([npc_corporation]) }

    specify { expect { subject.npc_corporations }.to change { subject.instance_variable_defined?(:@_memoized_npc_corporations) }.from(false).to(true) }
  end

  describe '#factions' do
    let(:faction) { double }

    let(:rowset) do
      [
        {
          '@fromID' => '500001',
          '@fromName' => 'Caldari State',
          '@standing' => '0.33'
        }
      ]
    end

    before do
      #
      # subject.factions_rowset # => [{"@fromID"=>"500001", "@fromName"=>"Caldari State", "@standing"=>"0.33"}]
      #
      expect(subject).to receive(:factions_rowset).and_return(rowset)
    end

    before do
      #
      # EveOnline::Standing.new(rowset.first) # => faction
      #
      expect(EveOnline::Standing).to receive(:new).with(rowset.first).and_return(faction)
    end

    specify { expect(subject.factions).to eq([faction]) }

    specify { expect { subject.factions }.to change { subject.instance_variable_defined?(:@_memoized_factions) }.from(false).to(true) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }")
    end
  end

  # private methods

  describe '#agents_rowset' do
    let(:character_npc_standings_rowset) { double }

    let(:rowset) { double }

    before do
      #
      # subject.result.fetch('characterNPCStandings').fetch('rowset').reject => character_npc_standings_rowset
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('characterNPCStandings') do
            double.tap do |b|
              expect(b).to receive(:fetch).with('rowset') do
                double.tap do |c|
                  expect(c).to receive(:reject).and_yield(character_npc_standings_rowset)
                end
              end
            end
          end
        end
      end
    end

    before do
      #
      # character_npc_standings_rowset.fetch('@name') != 'NPCCorporations' => rowset
      #
      expect(character_npc_standings_rowset).to receive(:fetch).with('@name') do
        double.tap do |a|
          expect(a).to receive(:!=).with('agents').and_return(rowset)
        end
      end
    end

    before do
      #
      # rowset.first.fetch('row')
      #
      expect(rowset).to receive(:first) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('row')
        end
      end
    end

    specify { expect { subject.send(:agents_rowset) }.not_to raise_error }

    specify { expect { subject.send(:agents_rowset) }.to change { subject.instance_variable_defined?(:@_memoized_agents_rowset) }.from(false).to(true) }
  end

  describe '#npc_corporations_rowset' do
    let(:character_npc_standings_rowset) { double }

    let(:rowset) { double }

    before do
      #
      # subject.result.fetch('characterNPCStandings').fetch('rowset').reject => character_npc_standings_rowset
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('characterNPCStandings') do
            double.tap do |b|
              expect(b).to receive(:fetch).with('rowset') do
                double.tap do |c|
                  expect(c).to receive(:reject).and_yield(character_npc_standings_rowset)
                end
              end
            end
          end
        end
      end
    end

    before do
      #
      # character_npc_standings_rowset.fetch('@name') != 'NPCCorporations' => rowset
      #
      expect(character_npc_standings_rowset).to receive(:fetch).with('@name') do
        double.tap do |a|
          expect(a).to receive(:!=).with('NPCCorporations').and_return(rowset)
        end
      end
    end

    before do
      #
      # rowset.first.fetch('row')
      #
      expect(rowset).to receive(:first) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('row')
        end
      end
    end

    specify { expect { subject.send(:npc_corporations_rowset) }.not_to raise_error }

    specify { expect { subject.send(:npc_corporations_rowset) }.to change { subject.instance_variable_defined?(:@_memoized_npc_corporations_rowset) }.from(false).to(true) }
  end

  describe '#factions_rowset' do
    let(:character_npc_standings_rowset) { double }

    let(:rowset) { double }

    before do
      #
      # subject.result.fetch('characterNPCStandings').fetch('rowset').reject => character_npc_standings_rowset
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('characterNPCStandings') do
            double.tap do |b|
              expect(b).to receive(:fetch).with('rowset') do
                double.tap do |c|
                  expect(c).to receive(:reject).and_yield(character_npc_standings_rowset)
                end
              end
            end
          end
        end
      end
    end

    before do
      #
      # character_npc_standings_rowset.fetch('@name') != 'factions' => rowset
      #
      expect(character_npc_standings_rowset).to receive(:fetch).with('@name') do
        double.tap do |a|
          expect(a).to receive(:!=).with('factions').and_return(rowset)
        end
      end
    end

    before do
      #
      # rowset.first.fetch('row')
      #
      expect(rowset).to receive(:first) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('row')
        end
      end
    end

    specify { expect { subject.send(:factions_rowset) }.not_to raise_error }

    specify { expect { subject.send(:factions_rowset) }.to change { subject.instance_variable_defined?(:@_memoized_factions_rowset) }.from(false).to(true) }
  end
end
