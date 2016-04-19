require 'spec_helper'

describe EveOnline::BaseCREST do
  specify { expect(subject).to be_a(EveOnline::Base) }

  describe '#initialize' do
    its(:parser) { should eq(JSON) }
  end
end
