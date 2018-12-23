# frozen_string_literal: true

require 'spec_helper'

describe Grammer::Node do
  let(:user_raw_data) { YAML.safe_load(open('./spec/fixtures/user_raw_data.yml')) }

  it { expect(described_class).to include(HTTParty) }

  describe '#data' do
    subject(:node) { described_class.new('caioertai') }
    it 'returns a hash of the given user' do
      expect(node.data).to be_a(Hash)
    end
  end
end
