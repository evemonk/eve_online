require 'spec_helper'

describe EveOnline::Exceptions::Exception do
  specify { expect(subject).to be_a(RuntimeError) }
end
