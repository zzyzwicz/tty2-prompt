# frozen_string_literal: true

RSpec.describe TTY2::Prompt, "#warn" do
  subject(:prompt) { TTY2::Prompt::Test.new }

  it "displays one message" do
    prompt.warn "Careful young apprentice!"
    expect(prompt.output.string).to eql "\e[33mCareful young apprentice!\e[0m\n"
  end

  it "displays many messages" do
    prompt.warn "Careful there!", "It's dangerous!"
    expect(prompt.output.string)
      .to eq("\e[33mCareful there!\e[0m\n\e[33mIt's dangerous!\e[0m\n")
  end

  it "displays message with option" do
    prompt.warn "Careful young apprentice!", newline: false
    expect(prompt.output.string).to eql "\e[33mCareful young apprentice!\e[0m"
  end

  it "changes default yellow color to cyan" do
    prompt.warn("All is fine", color: :cyan)
    expect(prompt.output.string).to eq("\e[36mAll is fine\e[0m\n")
  end
end
