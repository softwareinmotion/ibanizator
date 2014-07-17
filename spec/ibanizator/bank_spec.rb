require 'spec_helper'

describe Ibanizator::Bank do
  let(:bank) { Ibanizator::Bank.new('BIC', 'MyBank', '123 456 789') }

  describe '#initialize(bic, name, bank_code)' do
    it 'initializes the given bic property' do
      expect(Ibanizator::Bank.new('A-BIC', nil, nil).bic).to eq('A-BIC')
    end

    it 'initializes the given name property' do
      expect(Ibanizator::Bank.new(nil, 'some bank name', nil).name).to eq('some bank name')
    end

    it 'initializes the given bank_code property' do
      expect(Ibanizator::Bank.new(nil, nil, '100 000 00').bank_code).to eq('100 000 00')
    end
  end

  it 'defines equality based on the attributes' do
    b2 = Ibanizator::Bank.new('BIC', 'MyBank', '123 456 789')

    expect(bank).to eq(b2)
  end

  it 'makes banks immutable' do
    expect {
      bank.bic.downcase!
    }.to raise_error
  end
end
