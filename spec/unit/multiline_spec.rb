# frozen_string_literal: true

RSpec.describe TTY2::Prompt::Question, "#multiline" do
  subject(:prompt) { TTY2::Prompt::Test.new }

  it "reads no lines" do
    prompt.input << "\C-d"
    prompt.input.rewind

    answer = prompt.multiline("Description?")

    expect(answer).to eq([])
    expect(prompt.output.string).to eq([
      "Description? \e[90m(Press Ctrl+D or Ctrl+Z to finish)\e[0m\n",
      "\e[2K\e[1G\e[1A\e[2K\e[1G",
      "Description? \n"
    ].join)
  end

  it "uses defualt when no input" do
    prompt.input << "\C-d"
    prompt.input.rewind

    answer = prompt.multiline("Description?", default: "A super sweet prompt")

    expect(answer).to eq("A super sweet prompt")
    expect(prompt.output.string).to eq([
      "Description? \e[90m(Press Ctrl+D or Ctrl+Z to finish)\e[0m\n",
      "\e[2K\e[1G\e[1A\e[2K\e[1G",
      "Description? \e[32mA super sweet prompt\e[0m\n"
    ].join)
  end

  it "changes help text" do
    prompt.input << "\C-d"
    prompt.input.rewind

    answer = prompt.multiline("Description?") do |q|
      q.default "A super sweet prompt"
      q.help "(Press thy ctrl-d to end)"
    end

    expect(answer).to eq("A super sweet prompt")
    expect(prompt.output.string).to eq([
      "Description? \e[90m(Press thy ctrl-d to end)\e[0m\n",
      "\e[2K\e[1G\e[1A\e[2K\e[1G",
      "Description? \e[32mA super sweet prompt\e[0m\n"
    ].join)
  end

  it "sets quiet mode" do
    prompt = TTY2::Prompt::Test.new(quiet: true)
    prompt.input << "\C-d"
    prompt.input.rewind

    answer = prompt.multiline("Description?", default: "A super sweet prompt")

    expect(answer).to eq("A super sweet prompt")
    expect(prompt.output.string).to eq([
      "Description? \e[90m(Press Ctrl+D or Ctrl+Z to finish)\e[0m\n",
      "\e[2K\e[1G\e[1A\e[2K\e[1G"
    ].join)
  end

  it "reads multiple lines with empty lines" do
    prompt.input << "aa\n\nbb\n\n\ncc\C-d"
    prompt.input.rewind

    answer = prompt.multiline("Description?")
    expect(answer).to eq(%W[aa\n bb\n cc])
    expect(prompt.output.string).to eq([
      "Description? \e[90m(Press Ctrl+D or Ctrl+Z to finish)\e[0m\n",
      "\e[2K\e[1Ga",
      "\e[2K\e[1Gaa",
      "\e[2K\e[1Gaa\n",
      "\e[2K\e[1G\n",
      "\e[2K\e[1Gb",
      "\e[2K\e[1Gbb",
      "\e[2K\e[1Gbb\n",
      "\e[2K\e[1G\n",
      "\e[2K\e[1G\n",
      "\e[2K\e[1Gc",
      "\e[2K\e[1Gcc",
      "\e[2K\e[1G\e[1A" * 6,
      "\e[2K\e[1G",
      "Description? \e[32maa ...\e[0m\n"
    ].join)
  end
end
