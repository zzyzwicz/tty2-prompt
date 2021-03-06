# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

choices = [{
  key: "y",
  name: "overwrite this file",
  value: :yes
}, {
  key: "n",
  name: "do not overwrite this file",
  value: :no
}, {
  key: "a",
  name: "overwrite this file and all later files",
  value: :all
}, {
  key: "d",
  name: "show diff",
  value: :diff
}, {
  key: "q",
  name: "quit; do not overwrite this file ",
  value: :quit
}]

prompt = TTY2::Prompt.new

prompt.expand("Overwrite Gemfile?", choices, default: 3)
