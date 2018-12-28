# frozen_string_literal: true

require 'spec_helper'

class TestUser
  include Grammer
end

describe Grammer do
  it { expect { Grammer }.not_to raise_error }

  describe 'grammed_by class macro' do
    test_user = TestUser.new('caioertai')
    it { expect(test_user).to be_a(Node) }
  end
end
