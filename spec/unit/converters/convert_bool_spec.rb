# frozen_string_literal: true

RSpec.describe TTY2::Prompt::Question, "convert bool" do
  subject(:prompt) { TTY2::Prompt::Test.new }

  it "fails to convert boolean" do
    prompt.input << "x"
    prompt.input.rewind
    prompt.ask("Do you read books?", convert: :bool)

    expect(prompt.output.string).to eq([
      "Do you read books? ",
      "\e[2K\e[1G",
      "Do you read books? x",
      "\e[31m>>\e[0m Cannot convert `x` to 'bool' type",
      "\e[1A\e[2K\e[1G",
      "Do you read books? ",
      "\e[2K\e[1G\e[1A\e[2K\e[1G",
      "Do you read books? \n"
    ].join)
  end

  it "handles default values" do
    prompt.input << "\n"
    prompt.input.rewind
    response = prompt.ask("Do you read books?", convert: :bool, default: true)
    expect(response).to eql(true)
    expect(prompt.output.string).to eq([
      "Do you read books? \e[90m(true)\e[0m ",
      "\e[2K\e[1GDo you read books? \e[90m(true)\e[0m \n",
      "\e[1A\e[2K\e[1G",
      "Do you read books? \e[32mtrue\e[0m\n"
    ].join)
  end

  it "handles default values" do
    prompt.input << "\n"
    prompt.input.rewind
    response = prompt.ask("Do you read books?") { |q|
      q.default true
      q.convert :bool
    }
    expect(response).to eq(true)
  end

  it "converts negative boolean" do
    prompt.input << "No"
    prompt.input.rewind
    response = prompt.ask("Do you read books?", convert: :bool)
    expect(response).to eq(false)
  end

  it "converts positive boolean" do
    prompt.input << "Yes"
    prompt.input.rewind
    response = prompt.ask("Do you read books?", convert: :bool)
    expect(response).to eq(true)
  end

  it "converts single positive boolean" do
    prompt.input << "y"
    prompt.input.rewind
    response = prompt.ask("Do you read books?", convert: :bool)
    expect(response).to eq(true)
  end
end
