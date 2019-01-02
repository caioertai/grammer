# frozen_string_literal: true

require './lib/grammer/version'

Gem::Specification.new do |s|
  s.name        = 'grammer'
  s.version     = Grammer::VERSION::STRING
  s.author      = 'Caio Andrade'
  s.email       = 'caioertai@gmail.com'
  s.homepage    = 'https://github.com/caioertai/grammer'
  s.description = 'Instragram basic info scraping handler.'
  s.summary     = 'Provides a simple way to connect objects to the info on a Instagram account.'
  s.license     = 'MIT'

  s.extra_rdoc_files = %w[README.md]

  s.add_development('httparty', '>= 0.16.3')
  s.add_development('nokogiri', '>= 1.8.2')
  s.add_development_dependency('rspec', '~> 3.0')

  s.files = %w[README.md MIT-LICENSE] + Dir.glob('lib/**/*')
end
