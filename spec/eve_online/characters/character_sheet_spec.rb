require 'spec_helper'

describe EveOnline::Characters::CharacterSheet do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  let(:character_id) { 12_345_678 }

  subject { described_class.new(key_id, v_code, character_id) }

  specify { expect(subject).to be_a(EveOnline::BaseXML) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/CharacterSheet.xml.aspx') }

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

  # def as_json
  #   {
  #       character_id: character_id,
  #       name: name,
  #       home_station_id: home_station_id,
  #       dob: dob,
  #       race: race,
  #       blood_line_id: blood_line_id,
  #       blood_line: blood_line,
  #       ancestry_id: ancestry_id,
  #       ancestry: ancestry,
  #       gender: gender,
  #       corporation_name: corporation_name,
  #       corporation_id: corporation_id,
  #       alliance_name: alliance_name,
  #       alliance_id: alliance_id,
  #       faction_name: faction_name,
  #       faction_id: faction_id,
  #       clone_type_id: clone_type_id,
  #       clone_name: clone_name,
  #       clone_skill_points: clone_skill_points,
  #       free_skill_points: free_skill_points,
  #       free_respecs: free_respecs,
  #       clone_jump_date: clone_jump_date,
  #       last_respec_date: last_respec_date,
  #       last_timed_respec: last_timed_respec,
  #       remote_station_date: remote_station_date
  #   }
  # end

  describe '#name' do
    before do
      #
      # subject.result.fetch('name')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('name')
        end
      end
    end

    specify { expect { subject.name }.not_to raise_error }
  end

  describe '#home_station_id' do
    before do
      #
      # subject.result.fetch('homeStationID').to_i
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('homeStationID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.home_station_id }.not_to raise_error }
  end

  describe '#dob' do
    let(:dob) { double }

    before do
      #
      # subject.result.fetch('DoB') => dob
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('DoB').and_return(dob)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(dob)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(dob)
        end
      end
    end

    specify { expect { subject.dob }.not_to raise_error }
  end

  describe '#race' do
    before do
      #
      # subject.result.fetch('race')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('race')
        end
      end
    end

    specify { expect { subject.race }.not_to raise_error }
  end

  describe '#blood_line_id' do
    before do
      #
      # subject.result.fetch('bloodLineID').to_i
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('bloodLineID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.blood_line_id }.not_to raise_error }
  end

  describe '#blood_line' do
    before do
      #
      # subject.result.fetch('bloodLine')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('bloodLine')
        end
      end
    end

    specify { expect { subject.blood_line }.not_to raise_error }
  end

  describe '#ancestry_id' do
    before do
      #
      # subject.result.fetch('ancestryID').to_i
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('ancestryID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.ancestry_id }.not_to raise_error }
  end

  describe '#ancestry' do
    before do
      #
      # subject.result.fetch('ancestry')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('ancestry')
        end
      end
    end

    specify { expect { subject.ancestry }.not_to raise_error }
  end

  describe '#gender' do
    before do
      #
      # subject.result.fetch('gender')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('gender')
        end
      end
    end

    specify { expect { subject.gender }.not_to raise_error }
  end

  describe '#corporation_name' do
    before do
      #
      # subject.result.fetch('corporationName')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('corporationName')
        end
      end
    end

    specify { expect { subject.corporation_name }.not_to raise_error }
  end

  describe '#corporation_id' do
    before do
      #
      # subject.result.fetch('corporationID').to_i
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('corporationID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.corporation_id }.not_to raise_error }
  end

  describe '#alliance_name' do
    before do
      #
      # subject.result.fetch('allianceName')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('allianceName')
        end
      end
    end

    specify { expect { subject.alliance_name }.not_to raise_error }
  end

  describe '#alliance_id' do
    before do
      #
      # subject.result.fetch('allianceID').to_i
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('allianceID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.alliance_id }.not_to raise_error }
  end

  describe '#faction_name' do
    before do
      #
      # subject.result.fetch('factionName')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('factionName')
        end
      end
    end

    specify { expect { subject.faction_name }.not_to raise_error }
  end

  describe '#faction_id' do
    before do
      #
      # subject.result.fetch('factionID').to_i
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('factionID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.faction_id }.not_to raise_error }
  end

  describe '#clone_type_id' do
    before do
      #
      # subject.result.fetch('cloneTypeID').to_i
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('cloneTypeID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.clone_type_id }.not_to raise_error }
  end

  describe '#clone_name' do
    before do
      #
      # subject.result.fetch('cloneName')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('cloneName')
        end
      end
    end

    specify { expect { subject.clone_name }.not_to raise_error }
  end

  describe '#clone_skill_points' do
    before do
      #
      # subject.result.fetch('cloneSkillPoints').to_i
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('cloneSkillPoints') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.clone_skill_points }.not_to raise_error }
  end

  describe '#free_skill_points' do
    before do
      #
      # subject.result.fetch('freeSkillPoints').to_i
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('freeSkillPoints') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.free_skill_points }.not_to raise_error }
  end

  describe '#free_respecs' do
    before do
      #
      # subject.result.fetch('freeRespecs').to_i
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('freeRespecs') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.free_respecs }.not_to raise_error }
  end

  describe '#clone_jump_date' do
    let(:clone_jump_date) { double }

    before do
      #
      # subject.result.fetch('cloneJumpDate') => clone_jump_date
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('cloneJumpDate').and_return(clone_jump_date)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(clone_jump_date)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(clone_jump_date)
        end
      end
    end

    specify { expect { subject.clone_jump_date }.not_to raise_error }
  end

  describe '#last_respec_date' do
    let(:last_respec_date) { double }

    before do
      #
      # subject.result.fetch('lastRespecDate') => last_respec_date
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('lastRespecDate').and_return(last_respec_date)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(last_respec_date)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(last_respec_date)
        end
      end
    end

    specify { expect { subject.last_respec_date }.not_to raise_error }
  end

  describe '#last_timed_respec' do
    let(:last_timed_respec) { double }

    before do
      #
      # subject.result.fetch('lastTimedRespec') => last_timed_respec
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('lastTimedRespec').and_return(last_timed_respec)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(last_timed_respec)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(last_timed_respec)
        end
      end
    end

    specify { expect { subject.last_timed_respec }.not_to raise_error }
  end

  describe '#remote_station_date' do
    let(:remote_station_date) { double }

    before do
      #
      # subject.result.fetch('remoteStationDate') => remote_station_date
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('remoteStationDate').and_return(remote_station_date)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(remote_station_date)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(remote_station_date)
        end
      end
    end

    specify { expect { subject.remote_station_date }.not_to raise_error }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }")
    end
  end
end
