module Ruboty
  module Handlers
    class Suggest < Base
      on(
        //,
        description: "",
        hidden: true,
        missing: true,
        name: "suggest"
      )

      def suggest(message)
        Ruboty::Actions::Suggest.new(message).call
      end
    end
  end
end
