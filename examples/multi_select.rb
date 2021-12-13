# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new

drinks = %w[vodka beer wine whisky bourbon]
prompt.multi_select("Choose your favourite drink?", drinks)
