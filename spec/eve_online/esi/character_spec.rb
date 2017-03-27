require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::ESI::Character do
  let(:character_id) { 12_345_678 }

  subject { described_class.new(character_id) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v4/characters/%s/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(character_id) }
  end

  describe '#as_json' do
    let(:character) { described_class.new(character_id) }

    let(:birthday) { double }

    before { expect(character).to receive(:corporation_id).and_return(12_345_678) }

    before { expect(character).to receive(:birthday).and_return(birthday) }

    before { expect(character).to receive(:name).and_return('Green Black') }

    before { expect(character).to receive(:gender).and_return('male') }

    before { expect(character).to receive(:race_id).and_return(2) }

    before { expect(character).to receive(:bloodline_id).and_return(4) }

    before { expect(character).to receive(:description).and_return('') }

    before { expect(character).to receive(:alliance_id).and_return(98_765_432) }

    before { expect(character).to receive(:ancestry_id).and_return(24) }

    before { expect(character).to receive(:security_status).and_return(1.8694881661345457) }

    subject { character.as_json }

    its([:corporation_id]) { should eq(12_345_678) }

    its([:birthday]) { should eq(birthday) }

    its([:name]) { should eq('Green Black') }

    its([:gender]) { should eq('male') }

    its([:race_id]) { should eq(2) }

    its([:bloodline_id]) { should eq(4) }

    its([:description]) { should eq('') }

    its([:alliance_id]) { should eq(98_765_432) }

    its([:ancestry_id]) { should eq(24) }

    its([:security_status]) { should eq(1.8694881661345457) }
  end

  describe '#corporation_id' do
    before do
      #
      # subject.response['corporation_id']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('corporation_id')
        end
      end
    end

    specify { expect { subject.corporation_id }.not_to raise_error }
  end

  describe '#birthday' do
    context 'birthday is present' do
      let(:birthday) { double }

      before do
        #
        # subject.response['birthday'] => birthday
        #
        expect(subject).to receive(:response) do
          double.tap do |a|
            expect(a).to receive(:[]).with('birthday').and_return(birthday)
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

    context 'birthday not present' do
      before do
        #
        # subject.response['birthday'] => nil
        #
        expect(subject).to receive(:response) do
          double.tap do |a|
            expect(a).to receive(:[]).with('birthday').and_return(nil)
          end
        end
      end

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.birthday }.not_to raise_error }
    end
  end

  describe '#name' do
    before do
      #
      # subject.response['name']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('name')
        end
      end
    end

    specify { expect { subject.name }.not_to raise_error }
  end

  describe '#gender' do
    before do
      #
      # subject.response['gender']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('gender')
        end
      end
    end

    specify { expect { subject.gender }.not_to raise_error }
  end

  describe '#race_id' do
    before do
      #
      # subject.response['race_id']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('race_id')
        end
      end
    end

    specify { expect { subject.race_id }.not_to raise_error }
  end

  describe '#bloodline_id' do
    before do
      #
      # subject.response['bloodline_id']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('bloodline_id')
        end
      end
    end

    specify { expect { subject.bloodline_id }.not_to raise_error }
  end

  describe '#description' do
    before do
      #
      # subject.response['description']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('description')
        end
      end
    end

    specify { expect { subject.description }.not_to raise_error }
  end

  describe '#alliance_id' do
    before do
      #
      # subject.response['alliance_id']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('alliance_id')
        end
      end
    end

    specify { expect { subject.alliance_id }.not_to raise_error }
  end

  describe '#ancestry_id' do
    before do
      #
      # subject.response['ancestry_id']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('ancestry_id')
        end
      end
    end

    specify { expect { subject.ancestry_id }.not_to raise_error }
  end

  describe '#security_status' do
    before do
      #
      # subject.response['security_status']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('security_status')
        end
      end
    end

    specify { expect { subject.security_status }.not_to raise_error }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq(described_class::API_ENDPOINT % character_id)
    end
  end
end
