# frozen_string_literal: true

RSpec.describe TTY2::Prompt::Question, "convert string" do
  it "converts string" do
    prompt = TTY2::Prompt::Test.new
    prompt.input << "Piotr"
    prompt.input.rewind
    answer = prompt.ask("What is your name?", convert: :string)
    expect(answer).to be_a(String)
    expect(answer).to eq("Piotr")
  end

  it "converts symbol" do
    prompt = TTY2::Prompt::Test.new
    prompt.input << "Piotr"
    prompt.input.rewind
    answer = prompt.ask("What is your name?", convert: :symbol)
    expect(answer).to be_a(Symbol)
    expect(answer).to eq(:Piotr)
  end
end
