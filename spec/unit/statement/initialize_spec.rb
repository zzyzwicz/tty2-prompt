# frozen_string_literal: true

RSpec.describe TTY2::Prompt::Statement, ".new" do
  it "forces newline after the prompt message" do
    prompt = TTY2::Prompt::Test.new
    statement = described_class.new(prompt)
    expect(statement.newline).to eq(true)
  end

  it "displays prompt message in color" do
    prompt = TTY2::Prompt::Test.new
    statement = described_class.new(prompt)
    expect(statement.color).to eq(false)
  end
end
