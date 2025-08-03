# frozen_string_literal: true

require "spec_helper"

describe "Get a route between systems" do
  before { VCR.insert_cassette "esi/route" }

  after { VCR.eject_cassette }

  let(:options) do
    {origin: 30000142, destination: 30002187, flag:, avoid:, connections:}
  end
  let(:flag) { nil }
  let(:avoid) { nil }
  let(:connections) { nil }

  let(:jita_to_amarr) do
    [
      30000142, 30000138, 30000132, 30000134, 30005196, 30005192,
      30004083, 30004078, 30004079, 30004080, 30002282, 30002187
    ]
  end

  subject { EveOnline::ESI::Route.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.route).to eq(jita_to_amarr) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(38) }

  context "with flag" do
    let(:flag) { "secure" }

    let(:jita_to_amarr) do
      [
        30000142, 30000144, 30000139, 30002802, 30002801, 30002803, 30002768, 30002765, 30002764, 30002761,
        30004972, 30004970, 30002633, 30002634, 30002641, 30002681, 30002682, 30002048, 30002049, 30002053,
        30002543, 30002545, 30002568, 30002529, 30002526, 30002510, 30002509, 30000004, 30000005, 30000002,
        30002973, 30002969, 30002974, 30002972, 30002971, 30002970, 30002963, 30002964, 30002991, 30002994,
        30003545, 30003548, 30003525, 30003523, 30003522, 30002187
      ]
    end

    specify { expect(subject.route).to eq(jita_to_amarr) }

    context "with bad flag" do
      let(:flag) { "safer" }

      specify { expect { subject }.to raise_error ArgumentError }
    end
  end

  context "with avoid" do
    let(:avoid) { [30005196] }

    let(:jita_to_amarr) do
      [
        30000142, 30000144, 30002642, 30002643, 30002644, 30002691, 30002718, 30002719, 30002720, 30002050,
        30002051, 30002060, 30002066, 30002099, 30002517, 30002537, 30002542, 30003068, 30003067, 30003065,
        30003520, 30003521, 30003522, 30002187
      ]
    end

    specify { expect(subject.route).to eq(jita_to_amarr) }
  end

  context "with connections" do
    let(:connections) { [[30000142, 30002187]] }

    let(:jita_to_amarr) do
      [
        30000142, 30002187
      ]
    end

    specify { expect(subject.route).to eq(jita_to_amarr) }

    context "with bad connections" do
      let(:connections) { [[1234, 5678, 4321]] }

      specify { expect { subject }.to raise_error ArgumentError }
    end
  end
end
