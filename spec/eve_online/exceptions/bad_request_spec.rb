# frozen_string_literal: true

require "spec_helper"

describe EveOnline::Exceptions::BadRequest do
  specify { expect(subject).to be_a(EveOnline::Exceptions::Base) }
end
