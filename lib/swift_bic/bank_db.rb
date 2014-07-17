require_relative '../errors/invalid_bank_code_error'
require_relative '../errors/bank_not_found_error'

module SwiftBic
  class BankDb

    BANKS = {}.tap do |banks|
      File.open(File.expand_path("../../../db/blz.txt", __FILE__), 'r').each_line do |line|
        code, _, _, _, _, name, _, bic = line.unpack 'A8A1A58A5A35A27A5A11'
        next if bic.empty?
        name.force_encoding('iso-8859-1').encode!('utf-8')
        banks[code] = [name, bic]
      end
    end

    # <b>DEPRECATED:</b> Please use <tt>Ibanizator.bank_db</tt> instead.
    def initialize bank_code
      warn "[DEPRECATION] `SwiftBic::BankDb` is deprecated.  Please use `Ibanizator::bank_db` instead."
      validate_bank_code bank_code
      @bank_data = BANKS[bank_code]
      raise BankNotFoundError unless @bank_data
    end

    def bank_name
      @bank_data[0]
    end

    def bic
      @bank_data[1]
    end

    def validate_bank_code bank_code
      if bank_code.length == 8
        return true
      else
        raise InvalidBankCodeError
      end
    end
  end
end
