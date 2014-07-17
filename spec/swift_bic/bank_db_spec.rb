require_relative '../../lib/swift_bic/bank_db'
require_relative '../../lib/errors/invalid_bank_code_error'

describe SwiftBic::BankDb do
  let(:bank_db) { SwiftBic::BankDb.new '10000000' }

  describe '#initialize' do
    context 'given there is no bank for the bank code' do
      it 'raises a bank not found exception' do
        expect {
          SwiftBic::BankDb.new '12345678'
        }.to raise_error(BankNotFoundError)
      end
    end
  end

  describe '#bank_name' do
    it 'returns the bank name' do
      expect(bank_db.bank_name).to eq('BBk Berlin')
    end
  end

  describe '#bic' do
    it 'returns the bic' do
      expect(bank_db.bic).to eq('MARKDEF1100')
    end
  end

  describe '#validate_bank_code' do
    context 'given valid german bank code' do
      it 'returns true' do
        expect(bank_db.validate_bank_code('10000000')).to eq(true)
      end
    end

    context 'given invalid bank code' do
      it 'raises an invalid bank code exception' do
        expect {
          bank_db.validate_bank_code('123')
        }.to raise_error(InvalidBankCodeError)
      end
    end
  end
end
