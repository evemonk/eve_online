# frozen_string_literal: true

require "faraday"

require "eve_online/version"
require "eve_online/exceptions"

module EveOnline
  module ESI
    autoload :Client, "eve_online/esi/client"
    autoload :Object, "eve_online/esi/object"
    autoload :Collection, "eve_online/esi/collection"
    autoload :Middleware, "eve_online/esi/middleware"
    autoload :ParsedHeaders, "eve_online/esi/parsed_headers"

    module Resources
      autoload :Resource, "eve_online/esi/resources/resource"

      autoload :AlliancesResource, "eve_online/esi/resources/alliances_resource"

      autoload :UniverseResource, "eve_online/esi/resources/universe_resource"

      autoload :ServerStatusResource, "eve_online/esi/resources/server_status_resource"
    end

    module Models
      autoload :Alliance, "eve_online/esi/models/alliance"
      autoload :Alliances, "eve_online/esi/models/alliances"

      autoload :Race, "eve_online/esi/models/race"

      autoload :ServerStatus, "eve_online/esi/models/server_status"
    end

    module FaradayMiddlewares
      autoload :RaiseErrors, "eve_online/esi/faraday_middlewares/raise_errors"
    end

    Faraday::Response.register_middleware esi_middleware: Middleware
  end

  module Formulas
    autoload :BlueprintCopyTime, "eve_online/formulas/blueprint_copy_time"
    autoload :TrainingRate, "eve_online/formulas/training_rate"
  end
end
