class Ibanizator
  class BankDb
    class BankNotFoundError < StandardError ; end

    attr_reader :known_banks

    def initialize
      @known_banks = []
      @bic_index, @bank_code_index = {}, {}
      populate_known_banks!
    end

    def bank_by_bic(a_bic)
      @bic_index.fetch(a_bic.to_s) do
        error! "No bank for bic: #{a_bic} found"
      end
    end

    def bank_by_bank_code(a_bank_code)
      @bank_code_index.fetch(sanitize_bank_code(a_bank_code)) do
        error! "No bank for bank_code: #{a_bank_code} found"
      end
    end

    private
    def populate_known_banks!
      File.open(File.expand_path("../../../db/blz.txt", __FILE__), 'r').each_line do |line|
        code, _, _, _, _, name, _, bic = line.unpack 'A8A1A58A5A35A27A5A11'
        next if bic.empty?
        name.force_encoding('iso-8859-1').encode!('utf-8')
        bank = Bank.new(bic, name, code)
        @known_banks << bank
        @bic_index[bank.bic] = bank
        @bank_code_index[bank.bank_code] = bank
      end
    end

    def sanitize_bank_code(a_bank_code)
      a_bank_code.to_s.gsub(/\s+/, '')
    end

    def error!(message)
      raise BankNotFoundError, message
    end
  end
end
