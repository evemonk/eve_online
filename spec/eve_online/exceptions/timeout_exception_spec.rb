require 'spec_helper'

describe EveOnline::TimeoutException do
  specify { expect(subject).to be_a(EveOnline::Exception) }
end
