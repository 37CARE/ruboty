module Ellen
  module Handlers
    class Ping < Base
      on /ping\z/i, name: "ping", description: "Return PONG to PING"

      def ping(message)
        robot.say message.body[-4..-1].gsub(/i/i, "i" => "o", "I" => "O")
      end
    end
  end
end
