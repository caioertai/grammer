# frozen_string_literal: true

require 'spec_helper'

describe Grammer::Media do
  before(:each) do
    page = File.read('spec/fixtures/node_page.html')
    allow(Grammer::IgService).to receive_message_chain(:get) { page }
  end

  context '.all_from' do
    it 'returns an array of media when given a node' do
      node = Grammer::Node.new('caioertai')
      expect(described_class.all_from(node)).to be_a(Array)
    end
  end
end
