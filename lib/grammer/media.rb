# frozen_string_literal: true

module Grammer
  class Media
    attr_reader :data
    def initialize(media_data)
      @data = media_data
    end

    def image_url
      data.dig('display_url')
    end

    def likes_count
      data.dig('edge_liked_by', 'count')
    end

    def video?
      data.dig('is_video')
    end

    def self.all_from(node)
      node.data.dig('edge_owner_to_timeline_media', 'edges').map do |media|
        new(media.dig('node'))
      end
    end
  end
end
