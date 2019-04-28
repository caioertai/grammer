# frozen_string_literal: true

require 'spec_helper'

def data_forwarding_spec_for(method_name, path: nil, value: 'default')
  context "##{method_name}" do
    it "returns node #{path}" do
      data = [path].flatten.reverse.inject(value) { |mem, key| { key => mem } }
      expect(node_with_data(data).send(method_name)).to eq(value)
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
      expect(mocked_node.data['biography']).to eq('User Bio')
    end
  end

  context '#media' do
    it 'returns an array of media' do
      expect(mocked_node.media[0]).to be_a(Grammer::Media)
    end
  end

  context 'data forwarding methods' do
    data_forwarding_spec_for('biography', path: 'biography')
    data_forwarding_spec_for('business?', path: 'is_business_account')
    data_forwarding_spec_for('followers_count', path: %w[edge_followed_by count])
    data_forwarding_spec_for('following_count', path: %w[edge_follow count])
    data_forwarding_spec_for('full_name', path: 'full_name')
    data_forwarding_spec_for('id', path: 'id')
    data_forwarding_spec_for('private?', path: 'is_private')
    data_forwarding_spec_for('username', path: 'username')
    data_forwarding_spec_for('verified?', path: 'is_verified')
  end

  private

  def node_with_data(custom_node_data)
    custom_service = double('IgService', node: custom_node_data)
    described_class.new('caioertai', service: custom_service)
  end
end
