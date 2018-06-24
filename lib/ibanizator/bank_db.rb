class Ibanizator
  class BankDb
    class BankNotFoundError < StandardError; end

    attr_reader :known_banks, :bank_code_index, :bic_index

    def initialize
      @known_banks = []
      @bic_index = {}
      @bank_code_index = {}
      populate_known_banks!
    end

    def bank_by_bic(bic)
      @bic_index.fetch(bic.to_s) do
        error!("No bank for bic: #{bic} found")
      end
    end

    def bank_by_bank_code(bank_code)
      @bank_code_index.fetch(sanitize_bank_code(bank_code)) do
        error!("No bank for bank_code: #{bank_code} found")
      end
    end

    private

    def populate_known_banks!
      file = File.expand_path('../../db/blz.txt', __dir__)

      File.open(file, 'r').each_line do |line|
        code, _, _, _, _, name, _, bic = line.unpack 'A8A1A58A5A35A27A5A11'
        next if bic.empty?

        name.force_encoding('iso-8859-1').encode!('utf-8')
        bank = Bank.new(bic, name, code)

        add_bank_to_indices(bank)
      end
    end

    def sanitize_bank_code(bank_code)
      bank_code.to_s.gsub(/\s+/, '')
    end

    def error!(message)
      raise BankNotFoundError, message
    end

    def add_bank_to_indices(bank)
      @known_banks << bank

      @bic_index[bank.bic] = bank
      if optional_branch_code?(bank.bic)
        @bic_index[bank.bic.gsub(/XXX$/, '')] = bank
      end

      return if bank_exists_and_not_favored?(bank.bank_code, bank.bic)
      @bank_code_index[bank.bank_code] = bank
    end

    def optional_branch_code?(bic)
      bic.end_with?('XXX')
    end

    def bank_exists_and_not_favored?(bank_code, bic)
      @bank_code_index.key?(bank_code) && !optional_branch_code?(bic)
    end
  end
end
