# frozen_string_literal: true

require 'spec_helper'

describe Grammer::IgService do
  it { expect(described_class).to include(HTTParty) }

  context '#node' do
    it 'returns empty hash when no instagram user was found' do
      not_found_page = File.read('spec/fixtures/instagram_user_not_found.html')
      allow(described_class).to receive_message_chain(:get) { not_found_page }
      expect(subject.node('invalid_instagram_user')).to eq({})
    end
  end
end
