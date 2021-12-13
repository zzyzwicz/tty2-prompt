# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new(prefix: ">")

answer = prompt.ask

puts "Answer: \"#{answer}\""
