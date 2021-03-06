# frozen_string_literal: true

RSpec.describe TTY2::Prompt::Question, "#keypress" do
  subject(:prompt) { TTY2::Prompt::Test.new }

  it "receives line feed with echo on" do
    prompt.input << "\n"
    prompt.input.rewind

    answer = prompt.keypress("Press key:", echo: true)

    expect(answer).to eq("\n")
    expect(prompt.output.string).to eq([
      "Press key: ",
      "\e[2K\e[1G\e[1A\e[2K\e[1G",
      "Press key: \n\n"
    ].join)
  end

  it "asks for a keypress with echo on" do
    prompt.input << "abcd"
    prompt.input.rewind

    answer = prompt.keypress("Press key:", echo: true)

    expect(answer).to eq("a")
    expect(prompt.output.string).to eq([
      "Press key: ",
      "\e[2K\e[1G",
      "Press key: \e[32ma\e[0m\n"
    ].join)
  end

  it "asks for a keypress with echo off" do
    prompt.input << "abcd"
    prompt.input.rewind

    answer = prompt.keypress("Press key:")

    expect(answer).to eq("a")
    expect(prompt.output.string).to eq([
      "Press key: ",
      "\e[2K\e[1G",
      "Press key: \n"
    ].join)
  end

  it "interrupts input" do
    prompt = TTY2::Prompt::Test.new(interrupt: :exit)
    prompt.input << "\x03"
    prompt.input.rewind

    expect {
      prompt.keypress("Press key:")
    }.to raise_error(SystemExit)
  end

  it "timeouts when no key provided" do
    prompt = TTY2::Prompt::Test.new(interrupt: :exit)

    prompt.keypress("Press any key or continue in :countdown", timeout: 0.01)

    expect(prompt.output.string).to include("Press any key or continue in 0.00")
  end
end
