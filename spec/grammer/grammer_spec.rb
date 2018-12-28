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
  it { expect { Grammer }.not_to raise_error }

  context 'grammed_by class macro' do
    let(:test_user) { TestUser.new('caioertai') }
    it { expect(test_user.ig).to be_a(Grammer::Node) }
  end
end
