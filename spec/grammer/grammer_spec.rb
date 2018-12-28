# frozen_string_literal: true

require 'spec_helper'

class TestUser
  def initialize(username)
    @username = username
  end

  include Grammer
  grammed_by :username, on: :ig
end

describe Grammer do
  let(:node_data)       { YAML.safe_load(open('./spec/fixtures/node_data.yml')) }
  let(:service)         { double('IgService', node: node_data) }
  subject(:mocked_node) { Grammer::Node.new('caioertai', service: service) }

  it { expect { Grammer }.not_to raise_error }

  context 'grammed_by class macro' do
    let(:test_user) { TestUser.new('caioertai') }

    context 'macroed attribute' do
      it 'returns a Node object' do
        expect(test_user.ig).to be_a(Grammer::Node)
      end

      it 'has the correct data' do
        expect(test_user.ig.data).to eq(node_data)
      end
    end
  end
end
