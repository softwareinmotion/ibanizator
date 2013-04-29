require_relative '../../lib/iban/validator'

describe Iban::Validator do
  describe '#validate_iban(iban)' do
    context 'given the IBAN length does not match' do
      it 'returns false (german example)'
      it 'returns false (UK example)'
      it 'returns false (spanish example)'
    end

    context 'given the IBAN has the correct length' do
      context 'given the IBAN is valid' do
        it 'returns true (german example)'
        it 'returns true (UK example)'
      end

      context 'given the IBAN is invalid' do
        it 'returns false (checksum is not correct)'
        it 'returns false (contains invalid characters)'
      end
    end
  end
end
