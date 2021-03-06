# frozen_string_literal: true

module TTY2
  class Prompt
    # An immutable representation of a single choice option from select menu
    #
    # @api public
    class Choice
      # Create choice from value
      #
      # @examples
      #   Choice.from(:foo)
      #   # => <TTY2::Prompt::Choice @key=nil @name="foo" @value="foo" @disabled=false>
      #
      #   Choice.from([:foo, 1])
      #   # => <TTY2::Prompt::Choice @key=nil @name="foo" @value=1 @disabled=false>
      #
      #   Choice.from({name: :foo, value: 1, key: "f"}
      #   # => <TTY2::Prompt::Choice @key="f" @name="foo" @value=1 @disabled=false>
      #
      # @param [Object] val
      #   the value to be converted
      #
      # @raise [ArgumentError]
      #
      # @return [Choice]
      #
      # @api public
      def self.from(val)
        case val
        when Choice
          val
        when Array
          convert_array(val)
        when Hash
          convert_hash(val)
        else
          new(val, val)
        end
      end

      # Convert an array into choice
      #
      # @param [Array<Object>]
      #
      # @return [Choice]
      #
      # @api public
      def self.convert_array(val)
        name, value, options = *val
        if name.is_a?(Hash)
          convert_hash(name)
        elsif val.size == 1
          new(name.to_s, name.to_s)
        else
          new(name.to_s, value, **(options || {}))
        end
      end

      # Convert a hash into choice
      #
      # @param [Hash<Symbol,Object>]
      #
      # @return [Choice]
      #
      # @api public
      def self.convert_hash(val)
        if val.key?(:name) && val.key?(:value)
          new(val[:name].to_s, val[:value], **val)
        elsif val.key?(:name)
          new(val[:name].to_s, val[:name].to_s, **val)
        else
          new(val.keys.first.to_s, val.values.first)
        end
      end

      # The label name
      #
      # @api public
      attr_reader :name

      # The keyboard key to activate this choice
      #
      # @api public
      attr_reader :key

      # The text to display for disabled choice
      #
      # @api public
      attr_reader :disabled

      # Create a Choice instance
      #
      # @api public
      def initialize(name, value, **options)
        @name  = name
        @value = value
        @key   = options[:key]
        @disabled = options[:disabled].nil? ? false : options[:disabled]
        freeze
      end

      # Check if this choice is disabled
      #
      # @return [Boolean]
      #
      # @api public
      def disabled?
        !!@disabled
      end

      # Read value and evaluate
      #
      # @api public
      def value
        case @value
        when Proc
          @value.call
        else
          @value
        end
      end

      # Object equality comparison
      #
      # @return [Boolean]
      #
      # @api public
      def ==(other)
        return false unless other.is_a?(self.class)

        name == other.name &&
          value == other.value &&
          key == other.key
      end

      # Object string representation
      #
      # @return [String]
      #
      # @api public
      def to_s
        name.to_s
      end
    end # Choice
  end # Prompt
end # TTY2
