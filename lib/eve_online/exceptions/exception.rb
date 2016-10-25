module EveOnline
  module Exceptions
    # This is base EveOnline exception class. Rescue it if you want to
    # catch any exceptions from EveOnline.
    class Exception < RuntimeError
    end
  end
end
