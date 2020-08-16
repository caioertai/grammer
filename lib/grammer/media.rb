# frozen_string_literal: true

module Grammer
  ##
  # = Media
  # Represents Instagram media
  class Media
    extend InterfaceAdapter
    attr_adapter height: %w[dimensions height],
                 image_url: 'display_url',
                 likes_count: %w[edge_liked_by count],
                 text: ['edge_media_to_caption', 'edges', 0, 'node', 'text'],
                 video?: 'is_video',
                 width: %w[dimensions width]

    ##
    # General Instagram hash of data from the media
    attr_reader :data

    def initialize(media_data)
      @data = media_data
    end

    def self.all_from(node)
      node.data.dig('edge_owner_to_timeline_media', 'edges').map do |media|
        new(media.dig('node'))
      end
    end
  end
end
