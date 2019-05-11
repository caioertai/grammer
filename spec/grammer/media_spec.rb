# frozen_string_literal: true

require 'spec_helper'

describe Grammer::Media do
  before(:each) do
    page = File.read('spec/fixtures/node_page.html')
    allow(Grammer::IgService).to receive_message_chain(:get) { page }
  end

  context 'data forwarding methods' do
    let(:media_data) do
      {
        'edge_liked_by' => { 'count' => 123 },
        'display_url' => 'http://test.img',
        'is_video' => false
      }
    end

    data_forwarding_spec_for('likes_count', path: %w[edge_liked_by count])

    context '#video?' do
      it 'returns media likes count' do
        likes_count = described_class.new(media_data).video?
        expect(likes_count).to eql(false)
      end
    end

    context '#image_url' do
      it 'returns media image url' do
        image_url = described_class.new(media_data).image_url
        expect(image_url).to eql('http://test.img')
      end
    end
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
