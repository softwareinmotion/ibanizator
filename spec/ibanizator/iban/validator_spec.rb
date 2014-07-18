require 'spec_helper'

describe Ibanizator::Iban::Validator do
  let(:iban_string) { "DE6821050170001234567853" }
  let(:iban) { Ibanizator::Iban.new(iban_string) }

  def validator(iban_string)
    iban = Ibanizator::Iban.new(iban_string)
    Ibanizator::Iban::Validator.new(iban)
  end

  describe '#initialize' do
    it 'takes the iban as an argument' do
      expect(validator(iban_string).iban).to eq(iban.iban_string)
    end
  end

  describe '#validate' do
    context 'given the IBAN length does not match' do
      it 'returns false (german example)' do
        expect(validator("DE68 2105 0170 0012 3456 7853").validate).to eq(false)
      end

      it 'returns false (UK example)' do
        expect(validator("GB82 WEST 1234 5698 7654 3").validate).to eq(false)
      end

      it 'returns false (spanish example)' do
        expect(validator("ES76 2077 0024 0031 0257 576").validate).to eq(false)
      end
    end

    context 'given the IBAN has the correct length' do
      context 'given the IBAN is valid' do
        it 'returns true (german example)' do
          expect(validator("DE68 2105 0170 0012 3456 78").validate).to eq(true)
        end

        it 'returns true (UK example)' do
          expect(validator("GB82 WEST 1234 5698 7654 32").validate).to eq(true)
        end

        it 'returns true (spanish example)' do
          expect(validator("ES76 2077 0024 0031 0257 5766").validate).to eq(true)
        end
      end

      context 'given the IBAN is invalid' do
        it 'returns false (checksum is not correct)' do
          expect(validator("DE00 2105 0170 0012 3456 78").validate).to eq(false)
        end

        it 'returns false (contains invalid characters)' do
          expect(validator("DE00 $&%5 0170 0012 3456 78").validate).to eq(false)
        end
      end
    end
  end
end
