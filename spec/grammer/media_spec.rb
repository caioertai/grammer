# frozen_string_literal: true

require 'spec_helper'

describe Grammer::Media do
  before(:each) do
    page = File.read('spec/fixtures/node_page.html')
    allow(Grammer::IgService).to receive_message_chain(:get) { page }
  end

  context 'data forwarding methods' do
    data_forwarding_spec_for('likes_count', path: %w[edge_liked_by count])
    data_forwarding_spec_for('video?', path: 'is_video')
    data_forwarding_spec_for('image_url', path: 'display_url')
  end

  context '.all_from' do
    it 'returns an array of media when given a node' do
      node = Grammer::Node.new('caioertai')
      media_collection = described_class.all_from(node)
      expect(media_collection).to be_a(Array)
    end
  end

  private

  def described_class_with_data(custom_node_data)
    described_class.new(custom_node_data)
  end
end
