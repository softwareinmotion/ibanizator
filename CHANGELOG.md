# Changelog

## 0.4.12

- **Features:**
  - Updated bank database (valid until December 05 2021)

## 0.4.11

- **Features:**
  - Updated bank database (valid until September 07 2021)

## 0.4.10

- **Features:**
  - Updated blz.txt (valid until 06.06.2021)
  - Added 3.0.0 to tested ruby versions
  - Added jruby, truffleruby and truffleruby-head to tested ruby versions
  - Changed gem to be tested via github actions instead of travis.ci

## 0.4.9

- **Features:**
  - Updated blz.txt (valid until 07.03.2021)
  - Update tested ruby versions to 2.7.2

## 0.4.8

- **Features:**
  - Updated blz.txt (valid until 06.12.2020)

## 0.4.7

- **Features:**
  - Updated blz.txt (valid until 06.09.2020)
  - Add ruby version 2.7.1 to tests
  - Update tested ruby versions to 2.5.8 and 2.6.6
  - Removed support for ruby 2.4 due to eol since 31.03.2020
  - Updated dev dependencies
  - Updated and added multiple iban lengths ([#27](https://github.com/softwareinmotion/ibanizator/pull/27), [#28](https://github.com/softwareinmotion/ibanizator/pull/28)) ~ *thanks to [skorth](https://github.com/skorth) and [svoop](https://github.com/svoop)*

## 0.4.6

- **Features:**
  - Updated blz.txt (valid until 08.03.2020)
  - Update tested ruby versions to 2.4.9, 2.5.7 and 2.6.5

## 0.4.5

- **Features:**
  - Updated blz.txt (valid until 08.12.2019)
  - Update tested ruby versions to 2.4.7, 2.5.6 and 2.6.4

## 0.4.4

- **Features:**
  - Updated blz.txt (valid until 08.09.2019)
  - Update tested ruby versions to 2.4.6, 2.5.5 and 2.6.3
  - Removed support for ruby 2.3 due to eol since 31.03.2019
  - Removed support for ruby 2.2 due to eol since 31.03.2018

## 0.4.3

- **Features:**
  - Updated blz.txt (valid until 02.06.2019)
  - Updated ruby version from 2.5.3 to 2.6.0

## 0.4.2

- **Features:**
  - Updated blz.txt (valid until 03.03.2019)
  - Updated ruby version from 2.5.1 to 2.5.3
  - Updated Bundesbank link

## 0.4.1

- **Features:**
  - Updated blz.txt (valid until 02.12.2018)

## 0.4.0

- **Breaking Changes:**
  - Removed deprecated class `SwiftBic::BankDb` in favor of `Ibanizator::BankDb` ([#24](https://github.com/softwareinmotion/ibanizator/pull/24))
  - Removed deprecated method `Iban::Validator.validate_iban` in favor of `Ibanizator.iban_from_string(iban).valid?` ([#24](https://github.com/softwareinmotion/ibanizator/pull/24))
  - Removed deprecated method `Ibanizator.new.validate_iban(iban)` in favor of `Ibanizator.iban_from_string(iban).valid?` ([#24](https://github.com/softwareinmotion/ibanizator/pull/24))
  - Removed deprecated method `Ibanizator.new.bic(bank_code)` in favor of `Ibanizator::BankDb.new.bank_by_bank_code(bank_code).bic` ([#24](https://github.com/softwareinmotion/ibanizator/pull/24))
  - Removed deprecated method `Ibanizator.new.bank_name(bank_code)` in favor of `Ibanizator::BankDb.new.bank_by_bank_code(bank_code).name` ([#24](https://github.com/softwareinmotion/ibanizator/pull/24))

- **Features:**
  - Added `formatted_iban_string` instance method to `Ibanizator::Iban` for an iban with spaces. ([#17](https://github.com/softwareinmotion/ibanizator/pull/17)) ~ *thanks to [phoet](https://github.com/phoet)*
  - Also adding a `bank_name` and `to_hash` instance method to `Ibanizator::Iban::ExtendedData::DE`. ([#17](https://github.com/softwareinmotion/ibanizator/pull/17)) ~ *thanks to [phoet](https://github.com/phoet)*
  - Added short version of bics containing an optional branch code e.g. Deutsche Bank can be found either with DEUTDEBBXXX or DEUTDEBB. Additionally changed `#bank_by_bank_code` to favor banks whose bic ends in 'XXX' ([#22](https://github.com/softwareinmotion/ibanizator/pull/22))
  - Removed support for ruby 2.1 and added support for ruby 2.4 and 2.5 ([#23](https://github.com/softwareinmotion/ibanizator/pull/23))
  - Changed the contact information ([#25](https://github.com/softwareinmotion/ibanizator/pull/25))

## 0.3.5

- **Features:**
  - Updated blz.txt (valid until 02.09.2018)

- **Fixes:**
  - Fixed failing test suite ([#20](https://github.com/softwareinmotion/ibanizator/pull/20))

## 0.3.4 and blow

~ *Here be dragons* ~
