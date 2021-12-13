# frozen_string_literal: true

RSpec.describe TTY2::Prompt::Choices, "#<<" do
  it "adds choice to collection" do
    choices = described_class.new
    expect(choices).to be_empty
    choice = TTY2::Prompt::Choice.from([:label, 1])
    choices << [:label, 1]
    expect(choices.size).to eq(1)
    expect(choices.to_ary).to eq([choice])
  end
end
