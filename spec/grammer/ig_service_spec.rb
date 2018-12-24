# frozen_string_literal: true

require 'spec_helper'

describe Grammer::IgService do
  it { expect(described_class).to include(HTTParty) }
end
