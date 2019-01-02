# frozen_string_literal: true

require 'spec_helper'

describe Grammer::Node do
  let(:node_data)       { YAML.safe_load(open('./spec/fixtures/node_data.yml')) }
  let(:service)         { double('IgService', node: node_data) }
  subject(:mocked_node) { described_class.new('caioertai', service: service) }

  describe '#initialize' do
    it 'initializes with custom service object' do
      expect{ described_class.new('caioertai', service: service) }.not_to raise_error
    end
  end

  describe '#data' do
    it 'returns a hash of the given user' do
      expect(mocked_node.data).to be_a(Hash)
    end

    it 'returns the correct data' do
      expect(mocked_node.data).to eq(node_data)
    end
  end

  describe '#biography' do
    it 'returns user biography' do
      expect(mocked_node.biography).to eq('User Bio')
    end
  end
end
