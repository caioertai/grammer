# frozen_string_literal: true

# Simplecov
require 'simplecov'
require 'simplecov-console'
SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.start

require File.expand_path('environment', __dir__)

# Webmock
require 'webmock/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def forwarding_spec_for(method_name, path: nil, value: 'default')
  context "##{method_name}" do
    it "returns #{path}" do
      data = [path].flatten.reverse.inject(value) { |mem, key| { key => mem } }
      expect(described_class_with_data(data).send(method_name)).to eq(value)
    end
  end
end
