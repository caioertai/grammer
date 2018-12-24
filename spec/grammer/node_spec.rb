# frozen_string_literal: true

require 'spec_helper'

describe Grammer::Node do
  let(:node_data) { YAML.safe_load(open('./spec/fixtures/node_data.yml')) }
  let(:service)   { double('IgService', node: node_data) }

  describe '#data' do
    subject(:mocked_node) { described_class.new('caioertai', service: service) }

    it 'returns a hash of the given user' do
      expect(mocked_node.data).to be_a(Hash)
    end
  end
end
