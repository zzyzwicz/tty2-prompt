# frozen_string_literal: true

require "stringio"

require_relative "../prompt"

module TTY2
  # Used for initializing test cases
  class Prompt
    module StringIOExtensions
      def wait_readable(*)
        true
      end

      def ioctl(*)
        80
      end
    end

    class Test < TTY2::Prompt
      def initialize(**options)
        @input = StringIO.new
        @input.extend(StringIOExtensions)
        @output = StringIO.new

        options.merge!({
          input: @input,
          output: @output,
          env: { "TTY2_TEST" => true },
          enable_color: options.fetch(:enable_color, true)
        })
        super(**options)
      end
    end # Test
  end # Prompt
end # TTY2
