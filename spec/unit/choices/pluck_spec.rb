# frozen_string_literal: true

RSpec.describe TTY2::Prompt::Choices, "#pluck" do
  it "plucks choice by key name" do
    collection = [{name: "large"}, {name: "medium"}, {name: "small"}]
    choices = described_class[*collection]
    expect(choices.pluck(:name)).to eq(%w[large medium small])
  end
end
