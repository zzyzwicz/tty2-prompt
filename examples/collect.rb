# frozen_string_literal: true

require "json"

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new(prefix: "[?] ")

result = prompt.collect do
  key(:name).ask("Name?")

  key(:age).ask("Age?", convert: :int)

  key(:address) do
    key(:street).ask("Street?", required: true)
    key(:city).ask("City?")
    key(:zip).ask("Zip?", validate: /\A\d{3}\Z/)
  end
end

puts JSON.pretty_generate(result)
