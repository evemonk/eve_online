# frozen_string_literal: true

module EveOnline
  module Exceptions
    # This is base EveOnline exception class. Rescue it if you want to
    # catch any exceptions from EveOnline.
    class Base < RuntimeError
    end

    class BadGateway < Base
    end

    class BadRequest < Base
    end

    class ErrorLimited < Base
    end

    class Forbidden < Base
    end

    class InternalServerError < Base
    end

    class NoContent < Base
    end

    class ResourceNotFound < Base
    end

    class ServiceUnavailable < Base
    end

    class Timeout < Base
    end

    class Unauthorized < Base
    end
  end
end
