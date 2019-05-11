# frozen_string_literal: true

require 'spec_helper'

describe Grammer do
  let(:node_data) { YAML.safe_load(open('./spec/fixtures/node_data.yml')) }
  let(:service)   { double('IgService', node: node_data) }

  it { expect { Grammer }.not_to raise_error }

  context '.node' do
    it 'instantiates a new node from given username and node_class' do
      node_class = spy(:node_class)
      described_class.node('hulk', with: node_class)
      expect(node_class).to have_received(:new)
    end
  end

  context '.grammed_by class macro' do
    let(:test_user) { TestUser.new('caioertai') }

    before(:each) do
      page = File.read('spec/fixtures/node_page.html')
      allow(Grammer::IgService).to receive_message_chain(:get) { page }

      # Test class for module inclusion
      class TestUser
        attr_reader :username
        def initialize(username)
          @username = username
        end

        include Grammer
      end

      # The following was needed to flat scope the class definition
      TestUser.instance_eval do
        grammed_by :username, on: :ig
      end
    end

    it 'macroed attribute returns a Node object' do
      expect(test_user.ig).to be_a(Grammer::Node)
    end
  end
end
