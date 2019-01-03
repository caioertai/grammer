# frozen_string_literal: true

require 'spec_helper'

describe Grammer::IgService do
  it { expect(described_class).to include(HTTParty) }

  context '#node' do
    it 'returns empty hash when no instagram user was found' do
      expect(subject.node('salkdjaslkjf')).to eq({})
    end
  end
end
