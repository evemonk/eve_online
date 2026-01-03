# frozen_string_literal: true

require "faraday/middleware"

module EveOnline
  module ESI
    module FaradayMiddlewares
      class RaiseErrors < Faraday::Middleware
        def call(env)
          @app.call(env).on_complete do |environment|
            on_complete(environment)
          end
        end

        def on_complete(env)
          case env[:status]
          when 204
            raise EveOnline::Exceptions::NoContent
          when 400
            raise EveOnline::Exceptions::BadRequest
          when 401
            raise EveOnline::Exceptions::Unauthorized
          when 403
            raise EveOnline::Exceptions::Forbidden
          when 404
            raise EveOnline::Exceptions::ResourceNotFound
          when 420
            raise EveOnline::Exceptions::ErrorLimited
          when 500
            raise EveOnline::Exceptions::InternalServerError
          when 502
            raise EveOnline::Exceptions::BadGateway
          when 503
            raise EveOnline::Exceptions::ServiceUnavailable
          end
        end
      end
    end
  end
end
