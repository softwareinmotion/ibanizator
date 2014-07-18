class Ibanizator
  class Iban
    class Validator
      attr_reader :iban

      def initialize(iban)
        @iban = iban.to_s
      end

      def validate
        valid_length? && valid_checksum?
      end

      private
      def valid_length?
        return false if iban.length <= 4 # two digits for the country code and two for the checksum
        country_code = iban[0..1].upcase.to_sym
        iban.length == LENGTHS[country_code]
      end

      def valid_checksum?
        number_representation = integerize(reorder(iban))
        number_representation % 97 == 1
      end

      def reorder(iban)
        "#{iban[4..-1]}#{iban[0..3]}"
      end

      def integerize(iban)
        iban.gsub(/[A-Z]/) do |match|
          match.ord - 'A'.ord + 10
        end.to_i
      end
    end
  end # Iban
end # Ibanizator
