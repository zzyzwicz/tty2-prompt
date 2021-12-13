# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new

alfabet = ("A".."Z").to_a

prompt.multi_select("Which letter?", alfabet, per_page: 7, max: 3)
