require 'spec_helper'

describe EveOnline::Exceptions::TimeoutException do
  specify { expect(subject).to be_a(EveOnline::Exceptions::Base) }
end
