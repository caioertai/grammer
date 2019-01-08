# frozen_string_literal: true

require 'spec_helper'

describe Grammer::Media do
  let(:media_data) { YAML.safe_load(open('./spec/fixtures/media_data.yml')) }

  before(:each) do
    page = File.read('spec/fixtures/node_page.html')
    allow(Grammer::IgService).to receive_message_chain(:get) { page }
  end

  context 'data forwarding methods' do
    context '#likes_count' do
      it 'returns media likes count' do
        likes_count = described_class.new(media_data).likes_count
        expect(likes_count).to eql(48)
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
end
