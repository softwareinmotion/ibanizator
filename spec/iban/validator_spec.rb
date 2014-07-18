require 'spec_helper'
require_relative '../../lib/iban/validator'

describe Iban::Validator do
  let(:validator) { Iban::Validator.new }

  describe '#validate_iban(iban)' do
    context 'given the IBAN length does not match' do
      it 'returns false (german example)' do
        expect(validator.validate_iban("DE68 2105 0170 0012 3456 7853")).to eq(false)
      end

      it 'returns false (UK example)' do
        expect(validator.validate_iban("GB82 WEST 1234 5698 7654 3")).to eq(false)
      end

      it 'returns false (spanish example)' do
        expect(validator.validate_iban("ES76 2077 0024 0031 0257 576")).to eq(false)
      end
    end

    context 'given the IBAN has the correct length' do
      context 'given the IBAN is valid' do
        it 'returns true (german example)' do
          expect(validator.validate_iban("DE68 2105 0170 0012 3456 78")).to eq(true)
        end

        it 'returns true (UK example)' do
          expect(validator.validate_iban("GB82 WEST 1234 5698 7654 32")).to eq(true)
        end

        it 'returns true (spanish example)' do
          expect(validator.validate_iban("ES76 2077 0024 0031 0257 5766")).to eq(true)
        end
      end

      context 'given the IBAN is invalid' do
        it 'returns false (checksum is not correct)' do
          expect(validator.validate_iban("DE00 2105 0170 0012 3456 78")).to eq(false)
        end

        it 'returns false (contains invalid characters)' do
          expect(validator.validate_iban("DE00 $&%5 0170 0012 3456 78")).to eq(false)
        end
      end
    end
  end
end
