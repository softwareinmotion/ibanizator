### 0.4.2

- **Features:**
  - Updated blz.txt (valid until 03.03.2019)
  - Updated ruby version from 2.5.1 to 2.5.3
  - Updated Bundesbank link

### 0.4.1

- **Features:**
  - Updated blz.txt (valid until 02.12.2018)

### 0.4.0

- **Breaking Changes:**
  - Removed deprecated class `SwiftBic::BankDb` in favor of `Ibanizator::BankDb` ([#24](https://github.com/softwareinmotion/ibanizator/pull/24))
  - Removed deprecated method `Iban::Validator.validate_iban` in favor of `Ibanizator.iban_from_string(iban).valid?` ([#24](https://github.com/softwareinmotion/ibanizator/pull/24))
  - Removed deprecated method `Ibanizator.new.validate_iban(iban)` in favor of `Ibanizator.iban_from_string(iban).valid?` ([#24](https://github.com/softwareinmotion/ibanizator/pull/24))
  - Removed deprecated method `Ibanizator.new.bic(bank_code)` in favor of `Ibanizator::BankDb.new.bank_by_bank_code(bank_code).bic` ([#24](https://github.com/softwareinmotion/ibanizator/pull/24))
  - Removed deprecated method `Ibanizator.new.bank_name(bank_code)` in favor of `Ibanizator::BankDb.new.bank_by_bank_code(bank_code) .bank_name` ([#24](https://github.com/softwareinmotion/ibanizator/pull/24))

- **Features:**
  - Added `formatted_iban_string` instance method to `Ibanizator::Iban` for an iban with spaces. ([#17](https://github.com/softwareinmotion/ibanizator/pull/17)) ~ *thanks to [phoet](https://github.com/phoet)*
  - Also adding a `bank_name` and `to_hash` instance method to `Ibanizator::Iban::ExtendedData::DE`. ([#17](https://github.com/softwareinmotion/ibanizator/pull/17)) ~ *thanks to [phoet](https://github.com/phoet)*
  - Added short version of bics containing an optional branch code e.g. Deutsche Bank can be found either with DEUTDEBBXXX or DEUTDEBB. Additionally changed `#bank_by_bank_code` to favor banks whose bic ends in 'XXX' ([#22](https://github.com/softwareinmotion/ibanizator/pull/22))
  - Removed support for ruby 2.1 and added support for ruby 2.4 and 2.5 ([#23](https://github.com/softwareinmotion/ibanizator/pull/23))
  - Changed the contact information ([#25](https://github.com/softwareinmotion/ibanizator/pull/25))

### 0.3.5

- **Features:**
  - Updated blz.txt (valid until 02.09.2018)

- **Fixes:**
  - Fixed failing test suite ([#20](https://github.com/softwareinmotion/ibanizator/pull/20))

### 0.3.4 and blow

~ *Here be dragons* ~
