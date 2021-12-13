# frozen_string_literal: true

RSpec.describe TTY2::Prompt::Question, "convert regexp" do
  it "converts regex" do
    prompt = TTY2::Prompt::Test.new
    prompt.input << "[a-z]*"
    prompt.input.rewind
    answer = prompt.ask("Regex?", convert: :regexp)
    expect(answer).to be_a(Regexp)
    expect(answer).to eq(/[a-z]*/)
  end
end
