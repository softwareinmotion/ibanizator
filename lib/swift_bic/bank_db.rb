require 'csv'
require_relative '../errors/invalid_bank_code_error'
require_relative '../errors/bank_not_found_error'

module SwiftBic
  class BankDb
    def initialize bank_code
      validate_bank_code bank_code
      @bank_data = banks[bank_code]
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

    private

    def banks 
      @@banks ||= {}.tap do |banks|
        CSV.foreach File.expand_path("../../../db/blz.csv", __FILE__), col_sep: '|' do |row|
          banks[row.first] = row[1..-1]
        end
      end
    end
  end
end
