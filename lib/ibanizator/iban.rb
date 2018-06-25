require 'equalizer'
require 'adamantium'

require_relative 'iban/extended_data'
require_relative 'iban/lengths'
require_relative 'iban/validator'

class Ibanizator
  class Iban
    attr_reader :iban_string
    alias_method :to_s, :iban_string

    include Equalizer.new(:iban_string)
    include Adamantium

    def initialize(an_iban)
      @iban_string = sanitize(an_iban)
    end

    def self.from_string(a_string)
      new(a_string)
    end

    def country_code
      cc = iban_string[0..1].to_sym
      LENGTHS.keys.include?(cc) ? cc : :unknown
    end
    memoize :country_code

    def extended_data
      if country_code == :DE
        ExtendedData::DE.new(self)
      end
    end
    memoize :extended_data

    def valid?
      Validator.new(self).validate
    end

    def formatted_iban_string
      iban_string.scan(/.{1,4}/).join(' ')
    end

    private
    def sanitize(input)
      input.to_s.gsub(/\s+/,'').upcase
    end
  end
end
