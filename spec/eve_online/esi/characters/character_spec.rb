require 'spec_helper'

describe EveOnline::ESI::Characters::Character do
  let(:character_id) { 12_345_678 }

  subject { described_class.new(character_id) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/latest/characters/%s/?datasource=tranquility') }

  describe '#initialize' do
    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(character_id) }
  end

  describe '#as_json' do
  end

  describe '#corporation_id' do
    before do
      #
      # subject.response.fetch('corporation_id')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('corporation_id')
        end
      end
    end

    specify { expect { subject.corporation_id }.not_to raise_error }
  end

  describe '#birthday' do
    let(:birthday) { double }

    before do
      #
      # subject.response.fetch('birthday')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('birthday').and_return(birthday)
        end
      end
    end

    before do
      #
      # subject.parse_datetime_with_timezone(birthday)
      #
      expect(subject).to receive(:parse_datetime_with_timezone).with(birthday)
    end

    specify { expect { subject.birthday }.not_to raise_error }
  end

  describe '#name' do
    before do
      #
      # subject.response.fetch('name')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('name')
        end
      end
    end

    specify { expect { subject.name }.not_to raise_error }
  end

  describe '#gender' do
    before do
      #
      # subject.response.fetch('gender')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('gender')
        end
      end
    end

    specify { expect { subject.gender }.not_to raise_error }
  end

  describe '#race_id' do
    before do
      #
      # subject.response.fetch('race_id')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('race_id')
        end
      end
    end

    specify { expect { subject.race_id }.not_to raise_error }
  end

  describe '#bloodline_id' do
    before do
      #
      # subject.response.fetch('bloodline_id')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('bloodline_id')
        end
      end
    end

    specify { expect { subject.bloodline_id }.not_to raise_error }
  end

  describe '#description' do
    before do
      #
      # subject.response.fetch('description')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('description')
        end
      end
    end

    specify { expect { subject.description }.not_to raise_error }
  end

  describe '#alliance_id' do
    before do
      #
      # subject.response.fetch('alliance_id')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('alliance_id')
        end
      end
    end

    specify { expect { subject.alliance_id }.not_to raise_error }
  end

  describe '#ancestry_id' do
    before do
      #
      # subject.response.fetch('ancestry_id')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('ancestry_id')
        end
      end
    end

    specify { expect { subject.ancestry_id }.not_to raise_error }
  end

  describe '#security_status' do
    before do
      #
      # subject.response.fetch('security_status')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('security_status')
        end
      end
    end

    specify { expect { subject.security_status }.not_to raise_error }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq(described_class::API_ENDPOINT % character_id)
    end
  end
end
