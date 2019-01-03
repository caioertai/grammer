# frozen_string_literal: true

require 'spec_helper'

describe Grammer do
  let(:node_data)       { YAML.safe_load(open('./spec/fixtures/node_data.yml')) }
  let(:service)         { double('IgService', node: node_data) }

  it { expect { Grammer }.not_to raise_error }

  context '.grammed_by class macro' do
    let(:test_user) { TestUser.new('caioertai') }

    before(:each) do
      # Test class for module inclusion
      class TestUser
        attr_reader :username
        def initialize(username)
          @username = username
        end

        include Grammer
      end

      # The following was needed to flat scope the class definition
      service_obj = service
      TestUser.instance_eval do
        grammed_by :username, on: :ig, service: service_obj
      end
    end

    it 'macroed attribute returns a Node object' do
      expect(test_user.ig).to be_a(Grammer::Node)
    end
  end
end
