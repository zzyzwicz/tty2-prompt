# frozen_string_literal: true

RSpec.describe TTY2::Prompt::Result do
  it "checks value to be invalid" do
    question = double(:question)
    result = TTY2::Prompt::Result.new(question, nil)

    answer = result.with { |_quest, value|
      if value.nil?
        [value, ["`#{value}` provided cannot be empty"]]
      else
        value
      end
    }
    expect(answer).to be_a(TTY2::Prompt::Result::Failure)
    expect(answer.success?).to eq(false)
    expect(answer.errors).to eq(["`` provided cannot be empty"])
  end

  it "checks value to be valid" do
    question = double(:question)
    result = TTY2::Prompt::Result.new(question, "Piotr")

    CheckRequired = Class.new do
      def self.call(_quest, value)
        if value.nil?
          [value, ["`#{value}` provided cannot be empty"]]
        else
          value
        end
      end
    end

    answer = result.with(CheckRequired)
    expect(answer).to be_a(TTY2::Prompt::Result::Success)
    expect(answer.success?).to eq(true)
    expect(answer.value).to eq("Piotr")
    expect(answer.errors).to eq([])
  end
end
