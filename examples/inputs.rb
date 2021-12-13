# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new

prompt.ask("What is your name?", default: ENV["USER"])
prompt.yes?("Do you like Ruby?")
prompt.mask("What is your secret?")
prompt.select("Choose your destiny?", %w[Scorpion Kano Jax])
