class Ibanizator
  class Bank
    attr_reader :bic, :name, :bank_code

    def initialize(bic, name, bank_code)
      @bic, @name, @bank_code = bic, name, bank_code
    end
  end
end
