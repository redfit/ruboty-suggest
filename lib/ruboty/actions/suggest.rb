module Ruboty
  module Actions
    class Suggest < Base
      def call
        message.reply("suggest")
      end
    end
  end
end
