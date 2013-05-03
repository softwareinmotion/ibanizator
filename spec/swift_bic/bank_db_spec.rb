require_relative '../../lib/swift_bic/bank_db'

describe SwiftBic::BankDb do
  let(:bank_db) { SwiftBic::BankDb.new '10000000' }

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
end