require 'spec_helper'

describe EveOnline::Exception do
  specify { expect(subject).to be_a(RuntimeError) }
end
