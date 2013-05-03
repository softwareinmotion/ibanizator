require 'spec_helper'

describe Ibanizator do
  let(:ibanizator) { Ibanizator.new }

  describe '#calculate_iban' do
    context 'given correct parameters' do
      let(:options) { { country_code: :de, bank_code: '12345678', account_number: '123456789' } }

      it 'calculates the correct checksum' do
        expect(ibanizator.calculate_iban(options)[2..3]).to eq('58')
      end

      context 'given parameters producing a one sign checksum' do
        let(:options) { { country_code: :de, bank_code: '10000000', account_number: '11111' } }

        it 'calculates the correct checksum and prepends zero' do
          expect(ibanizator.calculate_iban(options)[2..3]).to eq('04')
        end
      end

      it 'strings the given parameters in the correct way' do
        expect(ibanizator.calculate_iban(options)).to eq('DE58123456780123456789')
      end

      context 'given an account number with eight digits' do
        before :each do
          options[:account_number] = '12345678'
        end

        it 'fills the account number to ten digits' do
          expect(ibanizator.calculate_iban(options)[12..21]).to eq('0012345678')
        end
      end
    end

    context 'given wrong bank code' do
      it 'throws an exception'
    end

    context 'given to long account number' do
      it 'throws an exception'
    end

    context 'given other country code than :de' do
      it 'throws an exception'
    end
  end

  describe '#validate_iban' do
    context 'given valid iban' do
      let(:iban) { 'DE58123456780123456789' }

      it 'returns true' do
        expect(ibanizator.validate_iban(iban)).to be_true
      end
    end

    context 'given invalid iban' do
      let(:iban) { 'DE13100000001234567890' }

      it 'returns false' do
        expect(ibanizator.validate_iban(iban)).to be_false
      end

      context 'given invalid country code' do
        let(:iban) { 'XX13100000001234567890' }

        it 'returns false' do
          expect(ibanizator.validate_iban(iban)).to eq(false)
        end
      end

      context 'given invalid length' do
        let(:iban) { 'DE13100000001234567' }

        it 'returns false' do
          expect(ibanizator.validate_iban(iban)).to eq(false)
        end
      end
    end
  end

  describe '#bic' do
    before :each do
      SwiftBic::BankDb.stub(:new => stub(:bic => 'MARKDEF1100'))
    end

    describe 'given valid german bank code' do
      it 'returns the bic' do
        expect(ibanizator.bic('10000000')).to eq('MARKDEF1100')
      end
    end

    describe 'given invalid bank code' do
      it 'throws an exception'
    end
  end

  describe '#bank_name' do
    before :each do
      SwiftBic::BankDb.stub(:new => stub(:bic => 'BBk Berlin'))
    end

    describe 'given valid german bank code' do
      it 'returns the bank name' do
        expect(ibanizator.bic('10000000')).to eq('BBk Berlin')
      end
    end

    describe 'given invalid bank code' do
      it 'throws an exception'
    end
  end

  describe '#character_to_digit' do
    context 'given :de as country code' do
      it 'calculates 1314 as numeral country code' do
        expect(ibanizator.character_to_digit('de')).to eq('1314')
      end
    end
  end
end
