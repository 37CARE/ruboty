require "bundler"
require "mem"
require "slop"

module Ellen
  class << self
    include Mem

    def logger
      @logger ||= Ellen::Logger.new($stdout)
    end

    def die(message)
      logger.error("Error: #{message}")
      exit(1)
    end

    def adapters
      {}
    end
    memoize :adapters
  end
end

require "ellen/adapter_builder"
require "ellen/adapters/base"
require "ellen/adapters/shell"
require "ellen/command_builder"
require "ellen/commands/base"
require "ellen/commands/generate"
require "ellen/commands/run"
require "ellen/logger"
require "ellen/robot"
require "ellen/version"
