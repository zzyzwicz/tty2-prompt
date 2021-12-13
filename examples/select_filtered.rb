# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new

warriors = %w[Scorpion Kano Jax Kitana Raiden]

answer = prompt.select("Choose your destiny?", warriors, filter: true)

puts answer.inspect
