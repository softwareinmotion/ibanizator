require 'equalizer'
require 'adamantium'

class Ibanizator
  class Bank
    include Equalizer.new(:bic, :name, :bank_code)
    include Adamantium

    attr_reader :bic, :name, :bank_code

    def initialize(bic, name, bank_code)
      @bic, @name, @bank_code = bic, name, bank_code
    end
  end
end
