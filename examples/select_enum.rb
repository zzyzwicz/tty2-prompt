# frozen_string_litreal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new

warriors = %w[Scorpion Kano Jax]
prompt.select("Choose your destiny?", warriors, enum: ")")
