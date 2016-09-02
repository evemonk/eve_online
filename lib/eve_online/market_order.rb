module EveOnline
  class MarketOrder
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def as_json
      {
        order_id: order_id,
        char_id: char_id,
        station_id: station_id,
        vol_entered: vol_entered,
        vol_remaining: vol_remaining,
        min_volume: min_volume,
        order_state: order_state,
        type_id: type_id,
        range: range,
        account_key: account_key,
        duration: duration,
        escrow: escrow,
        price: price,
        bid: bid,
        issued: issued
      }
    end

    def order_id
      @order_id ||= options.fetch('@orderID').to_i
    end

    def char_id
      @char_id ||= options.fetch('@charID').to_i
    end

    def station_id
      @station_id ||= options.fetch('@stationID').to_i
    end

    def vol_entered
      @vol_entered ||= options.fetch('@volEntered').to_i
    end

    def vol_remaining
      @vol_remaining ||= options.fetch('@volRemaining').to_i
    end

    def min_volume
      @min_volume ||= options.fetch('@minVolume').to_i
    end

    def order_state
      @order_state ||= options.fetch('@orderState').to_i
    end

    def type_id
      @type_id ||= options.fetch('@typeID').to_i
    end

    def range
      @range ||= options.fetch('@range').to_i
    end

    def account_key
      @account_key ||= options.fetch('@accountKey').to_i
    end

    def duration
      @duration ||= options.fetch('@duration').to_i
    end

    def escrow
      @escrow ||= options.fetch('escrow').to_f
    end

    def price
      @price ||= options.fetch('@price').to_f
    end

    def bid
      @bid ||= options.fetch('@bid') == '1'
    end

    def issued
      @issued ||= ActiveSupport::TimeZone['UTC'].parse(options.fetch('@issued'))
    end
  end
end
