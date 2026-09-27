# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class FactionWarfareResources < Resource
        def leaderboards
          response = get_request("fw/leaderboards")

          Models::FactionWarfareLeaderboard.new(attributes: response.body, headers: response.headers)
        end

        def leaderboard_characters
          response = get_request("fw/leaderboards/characters")

          Models::FactionWarfareCharacterLeaderboard.new(attributes: response.body, headers: response.headers)
        end

        def leaderboard_corporations
          response = get_request("fw/leaderboards/corporations")

          Models::FactionWarfareCorporationLeaderboard.new(attributes: response.body, headers: response.headers)
        end

        def stats
          response = get_request("fw/stats")

          Collection.from_response(response, type: Models::FactionWarfareStat)
        end

        def systems
          response = get_request("fw/systems")

          Collection.from_response(response, type: Models::FactionWarfareSystem)
        end

        def wars
          response = get_request("fw/wars")

          Collection.from_response(response, type: Models::FactionWarfareWar)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end
