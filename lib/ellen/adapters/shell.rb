require "readline"

module Ellen
  module Adapters
    class Shell < Base
      PROMPT = "> "

      def run
        explain
        listen
      end

      def say(body, options = {})
        Ellen.logger.info(body)
      end

      private

      def explain
        Ellen.logger.info("Type `exit` or `quit` to end the session.")
      end

      def read
        Readline.readline(PROMPT, true)
      end

      def listen
        loop { step }
      rescue Interrupt
        exit
      end

      def step
        case body = read
        when "exit", "quit"
          exit
        else
          robot.receive(body: body, source: source)
        end
      end

      def source
        "shell user"
      end
    end
  end
end
