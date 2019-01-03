# frozen_string_literal: true

require 'spec_helper'

describe Grammer::IgService do
  it { expect(described_class).to include(HTTParty) }

  context '#node' do
    it 'returns empty hash when no instagram user was found' do
      Nokogiri = double('Nokogiri')
      allow(Nokogiri).to receive_message_chain(:parse, :at, :text, :match, '[]') { '{}' }
      expect(subject.node('salkdjaslkjf')).to eq({})
    end
  end
end
