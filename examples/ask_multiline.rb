# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new

prompt.ask("What\nis your\nname?", default: ENV["USER"])
