module EveOnline
  class WalletJournalEntry
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def as_json
      {
        date: date,
        ref_id: ref_id,
        ref_type_id: ref_type_id,
        owner_name1: owner_name1,
        owner_id1: owner_id1,
        owner_name2: owner_name2,
        owner_id2: owner_id2,
        arg_name1: arg_name1,
        arg_id1: arg_id1,
        amount: amount,
        balance: balance,
        reason: reason,
        tax_receiver_id: tax_receiver_id,
        tax_amount: tax_amount,
        owner1_type_id: owner1_type_id,
        owner2_type_id: owner2_type_id
      }
    end

    def date
      @date ||= ActiveSupport::TimeZone['UTC'].parse(options.fetch('@date'))
    end

    def ref_id
      @ref_id ||= options.fetch('@refID').to_i
    end

    def ref_type_id
      @ref_type_id ||= options.fetch('@refTypeID').to_i
    end

    def owner_name1
      @owner_name1 ||= options.fetch('@ownerName1')
    end

    def owner_id1
      @owner_id1 ||= options.fetch('@ownerID1').to_i
    end

    def owner_name2
      @owner_name2 ||= options.fetch('@ownerName2')
    end

    def owner_id2
      @owner_id2 ||= options.fetch('@ownerID2').to_i
    end

    def arg_name1
      @arg_name1 ||= options.fetch('@argName1')
    end

    def arg_id1
      @arg_id1 ||= options.fetch('@argID1').to_i
    end

    def amount
      @amount ||= options.fetch('@amount').to_f
    end

    def balance
      @balance ||= options.fetch('@balance').to_f
    end

    def reason
      @reason ||= options.fetch('@reason')
    end

    def tax_receiver_id
      # TODO: to_i
      @tax_receiver_id ||= options.fetch('@taxReceiverID')
    end

    def tax_amount
      @tax_amount ||= options.fetch('@taxAmount')
    end

    def owner1_type_id
      @owner1_type_id ||= options.fetch('@owner1TypeID').to_i
    end

    def owner2_type_id
      @owner2_type_id ||= options.fetch('@owner2TypeID').to_i
    end
  end
end
