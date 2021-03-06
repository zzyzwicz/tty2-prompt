# frozen_string_literal: true

require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new

prompt.ask("Folder name?") do |q|
  q.required(true)
  q.validate ->(v) { return !Dir.exist?(v) }
  q.messages[:valid?] = "Folder already exists?"
  q.messages[:required?] = "Folder name must not be empty"
end
