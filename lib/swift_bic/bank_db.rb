require 'sqlite3'

module SwiftBic
  class BankDb
    def initialize bank_number
      @bank_data = load_table_row bank_number
    end

    def bank_name
      @bank_data[1]
    end

    def bic
      @bank_data[2]
    end


    private

    def load_table_row bank_number
      begin
        db = SQLite3::Database.open(File.expand_path("../../../db/blz.db", __FILE__))
        row = db.execute("SELECT * FROM blz WHERE blz = '#{bank_number}'")
      rescue SQLite3::Exception => e
        throw e
      ensure
        db.close
      end
      row[0]
    end
  end
end
