require 'sqlite3'
require_relative '../errors/invalid_bank_code_error'
require_relative '../errors/bank_not_found_error'

module SwiftBic
  class BankDb
    def initialize bank_code
      validate_bank_code bank_code
      @bank_data = load_table_row bank_code
      raise BankNotFoundError unless @bank_data
    end

    def bank_name
      @bank_data[1]
    end

    def bic
      @bank_data[2]
    end

    def validate_bank_code bank_code
      if bank_code.length == 8
        return true
      else
        raise InvalidBankCodeError
      end
    end

    private

    def load_table_row bank_code
      begin
        db = SQLite3::Database.open(File.expand_path("../../../db/blz.db", __FILE__))
        row = db.execute("SELECT * FROM blz WHERE blz = '#{bank_code}'")
      rescue SQLite3::Exception => e
        throw e
      ensure
        db.close
      end
      row[0]
    end
  end
end
