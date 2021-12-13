# frozen_string_literal: true

require "pastel"
require_relative "../lib/tty2-prompt"

prompt = TTY2::Prompt.new
pastel = Pastel.new
notice = pastel.cyan.bold.detach

prompt.ask("What is your name?", default: ENV["USER"], active_color: notice,
                                 help_color: notice)
