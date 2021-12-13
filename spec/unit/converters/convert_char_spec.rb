# frozen_string_literal: true

RSpec.describe TTY2::Prompt::Question, "convert char" do
  it "reads single character" do
    prompt = TTY2::Prompt::Test.new
    prompt.input << "abcde"
    prompt.input.rewind
    response = prompt.ask("What is your favourite letter?", convert: :char)
    expect(response).to eq("a")
  end
end
