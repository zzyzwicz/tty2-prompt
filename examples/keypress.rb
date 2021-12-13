# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new

answer = prompt.keypress("Press any key to continue")

puts "Answer: #{answer.inspect}"
