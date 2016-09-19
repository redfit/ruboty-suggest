module Ruboty
  module Handlers
    class Suggest < Base
      on(
        //,
        missing: true,
        description: "",
        name: "suggest"
      )

      def suggest(message)
        Ruboty::Actions::Suggest.new(message).call
      end
    end
  end
end
