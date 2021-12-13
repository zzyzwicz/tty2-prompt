# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new

answer = prompt.multiline("Description:")

puts "Answer: #{answer.inspect}"
