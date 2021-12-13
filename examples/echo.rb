# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new

answer = prompt.ask("Password?", echo: false) do |q|
  q.validate(/^[^.]+\.[^.]+/)
end

puts "Password: #{answer}"
