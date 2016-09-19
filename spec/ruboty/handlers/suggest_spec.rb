require "spec_helper"

describe Ruboty::Handlers::Suggest do
  let(:robot) do
    Ruboty::Robot.new
  end

  describe "#suggest" do
    let(:from) do
      "alice"
    end

    let(:to) do
      "#general"
    end

    let(:said) do
      "@ruboty kong"
    end

    let(:replied) do
      <<~STRING
          Could not find command `kong`.
          Maybe you meant ping or whoami.
          Run `@ruboty help` for more commands.
      STRING
    end

    it "returns test" do
      expect(robot).to receive(:say).with(
        body: replied,
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
