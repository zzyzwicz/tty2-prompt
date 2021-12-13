# frozen_string_literal: true

RSpec.describe TTY2::Prompt, "#inspect" do
  it "inspects instance attributes" do
    prompt = TTY2::Prompt::Test.new

    expect(prompt.inspect).to eq([
      "#<TTY2::Prompt::Test",
      "prefix=\"\"",
      "quiet=false",
      "enabled_color=true",
      "active_color=:green",
      "error_color=:red",
      "help_color=:bright_black",
      "input=#{prompt.input}",
      "output=#{prompt.output}>"
    ].join(" "))
  end
end
