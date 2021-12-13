# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new

answer = prompt.yes?("Do you like Ruby?")

puts "Answer: #{answer}"
