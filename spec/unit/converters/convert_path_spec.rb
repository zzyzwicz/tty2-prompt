# frozen_string_literal: true

RSpec.describe TTY2::Prompt::Question, "convert path" do
  subject(:prompt) { TTY2::Prompt::Test.new }

  it "converts pathname" do
    prompt.input << "/foo/bar/baz"
    prompt.input.rewind

    answer = prompt.ask("File location?", convert: :path)

    expect(answer).to eql(::Pathname.new("/foo/bar/baz"))
  end
end
