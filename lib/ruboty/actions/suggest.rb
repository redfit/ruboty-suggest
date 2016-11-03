module Ruboty
  module Actions
    class Suggest < Base
      def call
        message.reply(suggestion_message)
      end

      private

      def suggestion_message
        <<~STRING
          Could not find command `#{input_command}`.
          Maybe you meant #{maybe_you_meant}.
          Run `@#{message.robot.name} help` for more commands.
        STRING
      end

      def maybe_you_meant
        sort_by_similarity[0..1].map { |s| "`#{s[:command]}`" }.join(" or ")
      end

      def sort_by_similarity
        suggestions.sort_by { |s| [-s[:similarity]] }
      end

      def input_command
        @input_command ||=
          message.body.gsub(Action.prefix_pattern(message.robot.name), "")
      end

      def suggestions
        Ruboty.actions.map do |action|
          {
            command: action.name,
            similarity: similarity(action.name)
          }
        end
      end

      def similarity(action_name)
        1 - Levenshtein.normalized_distance(input_command, action_name)
      end
    end
  end
end
