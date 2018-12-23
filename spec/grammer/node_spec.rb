# frozen_string_literal: true

require 'spec_helper'

describe Grammer::Node do
  let(:user_info) { YAML.safe_load(open('./spec/fixtures/user_info.yml')) }

  it { expect(described_class).to include(HTTParty) }

  describe '#json' do
    subject(:node) { described_class.new('caioertai') }
    it 'returns a json of the given user' do
      expect(node.json).to eq(user_info)
    end
  end
end
