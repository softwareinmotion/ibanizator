Gem::Specification.new do |s|
  s.name = 'ibanizator'
  s.version = '0.3.5'.freeze
  s.date = '2018-06-19'
  s.licenses = ['MIT']

  s.summary = 'An IBAN generator/validator and BIC generator for german accounts.'
  s.description = <<-HEREDOC
    ibanizator generates the correct IBAN for given account number and bank number
    for german accounts. It is possible to validate given international IBANS.
    Calculates also the BIC and bank names for given german bank codes.
  HEREDOC

  s.homepage = 'https://github.com/softwareinmotion/ibanizator'

  s.authors = ['Christoph Stettner']
  s.email = 'christoph.stettner@softwareinmotion.de'

  s.files = Dir.glob('lib/**/*') + %w[license.md README.md db/blz.txt]

  s.add_dependency 'adamantium', '~> 0.2.0'
  s.add_dependency 'equalizer', '~> 0.0.11'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 3.4'
end
