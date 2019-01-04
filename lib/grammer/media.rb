# frozen_string_literal: true

module Grammer
  class Media
    def initialize(media_data)
      
    end

    def self.all_from(node)
      node.data.dig('edge_owner_to_timeline_media', 'edges').map do |media|
        new(media)
      end
    end
  end
end
