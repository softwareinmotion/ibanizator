require 'spec_helper'

describe Ibanizator::BankDb do
  let(:db) { Ibanizator::BankDb.new }
  let(:deutsche_bank) do
    Ibanizator::Bank.new('DEUTDEBBXXX', 'Deutsche Bank Fil Berlin', '10070000')
  end

  describe '#initialize' do
    it 'initializes the known banks from the "blz.txt" file' do
      expect(db.known_banks).to include(deutsche_bank)
    end

    it 'initializes the bic_index' do
      expect(db.bic_index.keys).to include('DEUTDEBBXXX')
    end

    it 'adds shortened bics to the index' do
      expect(db.bic_index.keys).to include('DEUTDEBB')
    end

    it 'initializes the bank_code_index' do
      expect(db.bank_code_index).to include('10070000')
    end
  end

  describe '#bank_by_bic(a_bic)' do
    it 'returns a bank for the given bic' do
      expect(db.bank_by_bic('DEUTDEBBXXX')).to eq(deutsche_bank)
    end

    it 'raises an BankNotFoundError if no bank could be found' do
      expect { db.bank_by_bic('XXXXXXXXXXX') }.to raise_error(
        Ibanizator::BankDb::BankNotFoundError
      )
    end
  end

  describe '#bank_by_bank_code(a_bank_code)' do
    it 'returns a bank for the given bank code' do
      expect(db.bank_by_bank_code('100 700 00')).to eq(deutsche_bank)
    end

    it 'raises an BankNotFoundError if no bank could be found' do
      expect { db.bank_by_bank_code('000 000 00') }.to raise_error(
        Ibanizator::BankDb::BankNotFoundError
      )
    end
  end
end
