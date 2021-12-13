# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new

warriors = [
  "Scorpion",
  "Kano",
  { name: "Goro", disabled: "(injury)" },
  "Jax",
  "Kitana",
  "Raiden"
]

answer = prompt.select("Choose your destiny?", warriors, enum: ")")

puts answer.inspect
