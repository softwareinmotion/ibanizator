### (unreleased)

- Removed deprecated class `SwiftBic::BankDb` in favor of `Ibanizator::BankDb`
- Removed deprecated method `Iban::Validator.validate_iban` in favor of `Ibanizator.iban_from_string(iban).valid?`
- Removed deprecated method `Ibanizator.new.validate_iban(iban)` in favor of `Ibanizator.iban_from_string(iban).valid?`
- Removed deprecated method `Ibanizator.new.bic(bank_code)` in favor of `Ibanizator::BankDb.new.bank_by_bank_code(bank_code).bic`
- Removed deprecated method `Ibanizator.new.bank_name(bank_code)` in favor of `Ibanizator::BankDb.new.bank_by_bank_code(bank_code).bank_name`

### 0.3.5

- Updated blz.txt (valid until 02.09.2018)
- Fixed test suite

### 0.3.4 and blow

Here be dragons
