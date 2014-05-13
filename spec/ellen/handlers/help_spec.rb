require "spec_helper"

describe Ellen::Handlers::Help do
  let(:robot) do
    Ellen::Robot.new
  end

  describe "#help" do
    let(:from) do
      "alice"
    end

    let(:to) do
      "#general"
    end

    let(:body) do
      <<-EOS.strip_heredoc.strip
        ellen /help( me)?\\z/i - Show this help message
        ellen /ping\\z/i       - Return PONG to PING
      EOS
    end

    it "responds to `@ellen help` and says each handler's usage" do
      robot.should_receive(:say).with(
        body: body,
        from: to,
        to: from,
        original: {
          body: "@ellen help",
          from: from,
          robot: robot,
          to: to,
        },
      )
      robot.receive(body: "@ellen help", from: from, to: to)
    end
  end
end
