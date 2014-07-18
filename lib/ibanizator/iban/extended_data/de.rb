class Ibanizator
  class Iban
    module ExtendedData
      class DE
        attr_reader :iban
        include Equalizer.new(:iban)
        include Adamantium

        def initialize(iban)
          raise Invalid, "can't compute extended data on invalid iban" unless iban.valid?
          @iban = iban
        end

        def bank_code
          iban.to_s[4..11]
        end
        memoize :bank_code

        def account_number
          iban.to_s[12..-1].gsub(/\A0+/,"")
        end
        memoize :account_number

        def bic
          Ibanizator.bank_db.bank_by_bank_code(bank_code).bic
        end
        memoize :bic
      end
    end # ExtendedData
  end # Iban
end # Ibanizator
