# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new(interrupt: :exit)

prompt.on(:keypress) do |event|
  puts "name: #{event.key.name}, value: #{event.value.dump}"
end

prompt.on(:keyescape) do
  exit
end

prompt.read_keypress
