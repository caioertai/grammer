# frozen_string_literal: true

require 'spec_helper'

describe Grammer::Node do
  let(:node_page) { open('./spec/fixtures/node_page.html') }
  let(:service)   { double('IgService', node: Nokogiri::HTML(node_page)) }

  describe '#data' do
    subject(:mocked_node) { described_class.new('given_username', service: service) }

    it 'returns a hash of the given user' do
      expect(mocked_node.data).to be_a(Hash)
    end
  end
end
