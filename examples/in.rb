# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new

prompt.ask("How do you like it on scale 1 - 10?", in: "1-10") do |q|
  q.messages[:range?] = "Sorry wrong one!"
end
