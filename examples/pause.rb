# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new

answer = prompt.keypress("Press space or enter to continue, continuing automatically in :countdown ...", keys: %i[space return], timeout: 3)

puts "Answer: #{answer.inspect}"
