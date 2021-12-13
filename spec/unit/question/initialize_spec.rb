# frozen_string_literal: true

RSpec.describe TTY2::Prompt::Question, "#initialize" do
  subject(:question) { described_class.new(TTY2::Prompt::Test.new) }

  it { expect(question.echo).to eq(true) }

  it { expect(question.modifier).to eq([]) }

  it { expect(question.validation).to eq(TTY2::Prompt::Question::UndefinedSetting) }
end
