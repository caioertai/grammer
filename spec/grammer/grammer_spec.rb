# frozen_string_literal: true

require 'spec_helper'

describe Grammer do
  let(:node_data)       { YAML.safe_load(open('./spec/fixtures/node_data.yml')) }

  it { expect { Grammer }.not_to raise_error }

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
