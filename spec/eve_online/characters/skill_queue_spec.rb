require 'spec_helper'

describe EveOnline::Characters::SkillQueue do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  let(:character_id) { 12_345_678 }

  subject { described_class.new(key_id, v_code, character_id) }

  specify { expect(subject).to be_a(EveOnline::BaseXML) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/SkillQueue.xml.aspx') }

  specify { expect(described_class::ACCESS_MASK).to eq(262_144) }

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

  describe '#skills' do
    context 'row is Hash' do
      let(:skill) { double }

      let(:row) do
        {
          '@queuePosition' => '0',
          '@typeID' => '3420',
          '@level' => '5',
          '@startSP' => '181020',
          '@endSP' => '1024000',
          '@startTime' => '2016-08-15 17:25:30',
          '@endTime' => '2016-08-31 23:41:36'
        }
      end

      before do
        #
        # subject.row # => {"@queuePosition"=>"0", "@typeID"=>"3420", "@level"=>"5", "@startSP"=>"181020", "@endSP"=>"1024000", "@startTime"=>"2016-08-15 17:25:30", "@endTime"=>"2016-08-31 23:41:36"}
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::SkillQueueEntry.new(row) # => skill
        #
        expect(EveOnline::SkillQueueEntry).to receive(:new).with(row).and_return(skill)
      end

      specify { expect(subject.skills).to eq([skill]) }

      specify { expect { subject.skills }.to change { subject.instance_variable_defined?(:@_memoized_skills) }.from(false).to(true) }
    end

    context 'row is Array' do
      let(:skill) { double }

      let(:row) do
        [
          {
            '@queuePosition' => '0',
            '@typeID' => '3420',
            '@level' => '5',
            '@startSP' => '181020',
            '@endSP' => '1024000',
            '@startTime' => '2016-08-15 17:25:30',
            '@endTime' => '2016-08-31 23:41:36'
          }
        ]
      end

      before do
        #
        # subject.row # => [{"@queuePosition"=>"0", "@typeID"=>"3420", "@level"=>"5", "@startSP"=>"181020", "@endSP"=>"1024000", "@startTime"=>"2016-08-15 17:25:30", "@endTime"=>"2016-08-31 23:41:36"}]
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::SkillQueueEntry.new(row.first) # => blueprint
        #
        expect(EveOnline::SkillQueueEntry).to receive(:new).with(row.first).and_return(skill)
      end

      specify { expect(subject.skills).to eq([skill]) }

      specify { expect { subject.skills }.to change { subject.instance_variable_defined?(:@_memoized_skills) }.from(false).to(true) }
    end

    context 'row is invalid' do
      before do
        #
        # subject.row # => 'invalid'
        #
        expect(subject).to receive(:row).and_return('invalid')
      end

      specify { expect { subject.skills }.to raise_error(ArgumentError) }
    end
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }")
    end
  end

  # private methods

  describe '#rowset' do
    before do
      #
      # subject.result.fetch('rowset')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('rowset')
        end
      end
    end

    specify { expect { subject.send(:rowset) }.not_to raise_error }

    specify { expect { subject.send(:rowset) }.to change { subject.instance_variable_defined?(:@_memoized_rowset) }.from(false).to(true) }
  end

  describe '#row' do
    before do
      #
      # subject.rowset.fetch('row')
      #
      expect(subject).to receive(:rowset) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('row')
        end
      end
    end

    specify { expect { subject.send(:row) }.not_to raise_error }

    specify { expect { subject.send(:row) }.to change { subject.instance_variable_defined?(:@_memoized_row) }.from(false).to(true) }
  end
end
