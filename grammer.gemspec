# frozen_string_literal: true

require './lib/grammer/version'

Gem::Specification.new do |s|
  s.name        = 'grammer'
  s.version     = Grammer::VERSION::STRING
  s.author      = 'Caio Andrade'
  s.email       = 'caioertai@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/grammer'
  s.summary     = 'Instragram basic info scraping handler.'
  s.license     = 'MIT'
  s.files       = [] + Dir.glob('lib/**/*')
  s.description = <<-DESC
    Provides a simple way to connect objects to the info on a Instagram account.'
  DESC

  s.extra_rdoc_files = %w[README.md]
  s.rdoc_options << 'lib/' << '--exclude' << 'lib/grammer/version.rb'

  s.add_runtime_dependency('httparty', '~> 0.16', '>= 0.16.3')
  s.add_runtime_dependency('nokogiri', '~> 1.8', '>= 1.8.2')

  s.add_development_dependency('pry-byebug', '~> 3.6')
  s.add_development_dependency('rdoc', '~> 6.1')
  s.add_development_dependency('reek', '~> 4.8')
  s.add_development_dependency('rspec', '~> 3.0')
  s.add_development_dependency('rubocop', '~> 0.62.0')
  s.add_development_dependency('simplecov', '~> 0.16.1')
end
