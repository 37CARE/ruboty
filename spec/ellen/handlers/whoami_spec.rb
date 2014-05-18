require "spec_helper"

describe Ellen::Handlers::Whoami do
  let(:robot) do
    Ellen::Robot.new
  end

  describe "#ping" do
    let(:from) do
      "alice"
    end

    let(:to) do
      "#general"
    end

    let(:said) do
      "@ellen Who am I?"
    end

    it "returns PONG to PING" do
      robot.should_receive(:say).with(
        body: from,
        from: to,
        to: from,
        original: {
          body: said,
          from: from,
          robot: robot,
          to: to,
        },
      )
      robot.receive(body: said, from: from, to: to)
    end
  end
end
