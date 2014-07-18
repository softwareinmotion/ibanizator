require 'spec_helper'

describe Ibanizator::BankDb do
  let(:db) { Ibanizator::BankDb.new }
  let(:bundesbank) { Ibanizator::Bank.new('MARKDEF1100', 'BBk Berlin', '10000000') }

  describe '#initialize' do
    it 'initializes the known banks from the "blz.txt" file' do
      expect(db.known_banks).to include(bundesbank)
    end

    it 'initializes the bic_index' do
      expect(db.instance_variable_get(:@bic_index).keys).to include('MARKDEF1100')
    end

    it 'initializes the bank_code_index' do
      expect(db.instance_variable_get(:@bank_code_index)).to include('10000000')
    end
  end

  describe '#bank_by_bic(a_bic)' do
    it 'returns a bank for the given bic' do
      expect(db.bank_by_bic('MARKDEF1100')).to eq(bundesbank)
    end

    it 'raises an BankNotFoundError if no bank could be found for the given bic' do
      expect {
        db.bank_by_bic('XXXXXXXXXXX')
      }.to raise_error(Ibanizator::BankDb::BankNotFoundError)
    end
  end

  describe '#bank_by_bank_code(a_bank_code)' do
    it 'returns a bank for the given bank code' do
      expect(db.bank_by_bank_code('100 000 00')).to eq(bundesbank)
    end

    it 'raises an BankNotFoundError if no bank could be found for the given bank code' do
      expect {
        db.bank_by_bank_code('000 000 00')
      }.to raise_error(Ibanizator::BankDb::BankNotFoundError)
    end
  end
end
