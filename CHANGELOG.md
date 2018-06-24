### (unreleased)

- Removed deprecated class `SwiftBic::BankDb` in favor of `Ibanizator::BankDb`
- Removed deprecated method `Iban::Validator.validate_iban` in favor of `Ibanizator.iban_from_string(iban).valid?`
- Removed deprecated method `Ibanizator.new.validate_iban(iban)` in favor of `Ibanizator.iban_from_string(iban).valid?`
- Removed deprecated method `Ibanizator.new.bic(bank_code)` in favor of `Ibanizator::BankDb.new.bank_by_bank_code(bank_code).bic`
- Removed deprecated method `Ibanizator.new.bank_name(bank_code)` in favor of `Ibanizator::BankDb.new.bank_by_bank_code(bank_code).bank_name`
- Removed support for ruby 2.1
- Added support for ruby 2.4
- Added support for ruby 2.5
- Added short version of bics containing an optional branch code e.g. Deutsche Bank can be found either with DEUTDEBBXXX or DEUTDEBB
- Changed `#bank_by_bank_code` to favor banks whose bic end in 'XXX'
- Changed the contact information

### 0.3.5

- Updated blz.txt (valid until 02.09.2018)
- Fixed test suite

### 0.3.4 and blow

~ *Here be dragons* ~
