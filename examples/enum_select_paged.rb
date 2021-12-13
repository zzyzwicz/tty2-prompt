# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new

alfabet = ("A".."Z").to_a

prompt.enum_select("Which letter?", alfabet, per_page: 4, cycle: true, default: 2)
