# frozen_string_literal: true

RSpec.describe TTY2::Prompt::Question, "#default" do
  subject(:prompt) { TTY2::Prompt::Test.new }

  it "uses default value" do
    name = "Anonymous"
    prompt.input << "\n"
    prompt.input.rewind
    answer = prompt.ask("What is your name?", default: name)
    expect(answer).to eq(name)
    expect(prompt.output.string).to eq([
      "What is your name? \e[90m(Anonymous)\e[0m ",
      "\e[2K\e[1GWhat is your name? \e[90m(Anonymous)\e[0m \n",
      "\e[1A\e[2K\e[1G",
      "What is your name? \e[32mAnonymous\e[0m\n"
    ].join)
  end

  it "uses default value in block" do
    name = "Anonymous"
    answer = prompt.ask("What is your name?") { |q| q.default(name) }
    expect(answer).to eq(name)
    expect(prompt.output.string).to eq([
      "What is your name? \e[90m(Anonymous)\e[0m ",
      "\e[1A\e[2K\e[1G",
      "What is your name? \e[32mAnonymous\e[0m\n"
    ].join)
  end
end
