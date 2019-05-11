# frozen_string_literal: true

require 'spec_helper'

describe Grammer::Node do
  subject(:mocked_node) { described_class.new('caioertai', service: service) }
  let(:service) { double('IgService', node: node_data) }
  let(:node_data) { YAML.safe_load(open('./spec/fixtures/node_data.yml')) }

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
    it 'calls #all_from the given media class' do
      media_class = spy('media')
      node = described_class.new('', media_class: media_class)
      node.media
      expect(media_class).to have_received(:all_from)
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

  def described_class_with_data(custom_node_data)
    custom_service = double('IgService', node: custom_node_data)
    described_class.new('caioertai', service: custom_service)
  end
end
