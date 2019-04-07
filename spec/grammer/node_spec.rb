# frozen_string_literal: true

require 'spec_helper'

def data_forwarding_spec_for(method_name, hash_location)
  context "##{method_name}" do
    it "returns node #{hash_location}" do
      custom_node = node_with_data(hash_location => true)
      expect(custom_node.send(method_name)).to eq(true)
    end
  end
end

describe Grammer::Node do
  subject(:mocked_node) { described_class.new('caioertai', service: service) }
  let(:node_data) { YAML.safe_load(open('./spec/fixtures/node_data.yml')) }
  let(:service) { double('IgService', node: node_data) }

  context '#initialize' do
    it 'initializes with custom service object' do
      expect { described_class.new('caioertai', service: service) }
        .not_to raise_error
    end
  end

  context '#data' do
    it 'returns a hash of the given user' do
      expect(mocked_node.data).to be_a(Hash)
    end

    it 'returns the correct data' do
      expect(mocked_node.data).to eq(node_data)
    end
  end

  context 'data forwarding methods' do
    context '#biography' do
      it 'returns node biography' do
        custom_node = node_with_data('biography' => 'Biography of the user')
        expect(custom_node.biography).to eq('Biography of the user')
      end
    end

    context '#followers_count' do
      it 'returns node followers count' do
        custom_node = node_with_data('edge_followed_by' => { 'count' => 24 })
        expect(custom_node.followers_count).to eq(24)
      end
    end

    context '#username' do
      it 'returns node username' do
        custom_node = node_with_data('username' => 'node_username')
        expect(custom_node.username).to eq('node_username')
      end
    end

    context '#private?' do
      it 'returns node privacy status' do
        custom_node = node_with_data('is_private' => true)
        expect(custom_node.private?).to eq(true)
      end
    end

    data_forwarding_spec_for('verified?', 'is_verified')
  end

  private

  def node_with_data(custom_node_data)
    custom_service = double('IgService', node: custom_node_data)
    described_class.new('caioertai', service: custom_service)
  end
end
