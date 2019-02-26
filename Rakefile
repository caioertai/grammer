# frozen_string_literal: true

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc 'Loads console with gem available'
task :console do
  require 'pry-byebug'

  $LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')
  require 'grammer'
  class User
    attr_reader :username

    include Grammer
    grammed_by :username, on: :ig

    def initialize(username)
      @username = username
    end
  end

  Pry.start
end
task c: :console
