### (unreleased)

- Added short version of bics containing an optional branch code e.g. Deutsche Bank can be found either with DEUTDEBBXXX or DEUTDEBB. Additionally changed `#bank_by_bank_code` to favor banks whose bic ends in 'XXX' ([#22](https://github.com/softwareinmotion/ibanizator/pull/22))
- Removed support for ruby 2.1 and added support for ruby 2.4 and 2.5 ([#23](https://github.com/softwareinmotion/ibanizator/pull/23))
- Removed deprecated class `SwiftBic::BankDb` in favor of `Ibanizator::BankDb`, `Iban::Validator.validate_iban` in favor of `Ibanizator.iban_from_string(iban).valid?`, `Ibanizator.new.validate_iban(iban)` in favor of `Ibanizator.iban_from_string(iban).valid?`, `Ibanizator.new.bic(bank_code)` in favor of `Ibanizator::BankDb.new.bank_by_bank_code(bank_code).bic` and `Ibanizator.new.bank_name(bank_code)` in favor of `Ibanizator::BankDb.new.bank_by_bank_code(bank_code).bank_name` ([#24](https://github.com/softwareinmotion/ibanizator/pull/24))
- Changed the contact information ([#25](https://github.com/softwareinmotion/ibanizator/pull/25))

### 0.3.5

- Updated blz.txt (valid until 02.09.2018)
- Fixed failing test suite ([#20](https://github.com/softwareinmotion/ibanizator/pull/20))

### 0.3.4 and blow

~ *Here be dragons* ~
