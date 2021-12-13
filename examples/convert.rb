# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new

answer = prompt.ask("Any digit:", convert: :float)

puts "Digit: #{answer.inspect}"
