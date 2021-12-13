# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new
prompt.slider("Volume", max: 100, step: 5, default: 75, format: "|:slider| %d%%")
