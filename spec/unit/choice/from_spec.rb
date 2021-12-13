# frozen_string_literal: true

RSpec.describe TTY2::Prompt::Choice, "#from" do
  it "skips Choice instance" do
    choice = described_class.new(:large, 1)

    expect(described_class.from(choice)).to eq(choice)
  end

  it "creates choice from a string" do
    expected_choice = described_class.new("large", "large")
    choice = described_class.from("large")

    expect(choice).to eq(expected_choice)
    expect(choice.name).to eq("large")
    expect(choice.value).to eq("large")
  end

  it "creates choice from a symbol" do
    expected_choice = described_class.new(:large, :large)
    choice = described_class.from(:large)

    expect(choice).to eq(expected_choice)
    expect(choice.name).to eq(:large)
    expect(choice.value).to eq(:large)
  end

  it "creates choice from an array with name only and defaults value" do
    expected_choice = described_class.new("large", "large")
    choice = described_class.from([:large])

    expect(choice).to eq(expected_choice)
    expect(choice.name).to eq("large")
    expect(choice.value).to eq("large")
  end

  it "creates choice from an array with name and a value" do
    expected_choice = described_class.new("large", 1)
    choice = described_class.from([:large, 1])

    expect(choice).to eq(expected_choice)
    expect(choice.name).to eq("large")
    expect(choice.value).to eq(1)
  end

  it "creates choice from an array with name and false value" do
    expected_choice = described_class.new("large", false)
    choice = described_class.from([:large, false])

    expect(choice).to eq(expected_choice)
    expect(choice.name).to eq("large")
    expect(choice.value).to eq(false)
  end

  it "creates choice from array with name and nil value" do
    expected_choice = described_class.new("none", nil)
    choice = described_class.from([:none, nil])

    expect(choice).to eq(expected_choice)
    expect(choice.name).to eq("none")
    expect(choice.value).to eq(nil)
  end

  it "creates choice from a hash with a value" do
    expected_choice = described_class.new("large", 1)
    choice = described_class.from({large: 1})

    expect(choice).to eq(expected_choice)
    expect(choice.name).to eq("large")
    expect(choice.value).to eq(1)
  end

  it "creates choice from a hash with a nil value" do
    expected_choice = described_class.new("large", nil)
    choice = described_class.from({large: nil})

    expect(choice).to eq(expected_choice)
    expect(choice.name).to eq("large")
    expect(choice.value).to eq(nil)
  end

  it "creates choice from an array with key-value pair" do
    expected_choice = described_class.new("large", 1)
    choice = described_class.from([{"large" => 1}])

    expect(choice).to eq(expected_choice)
    expect(choice.name).to eq("large")
    expect(choice.value).to eq(1)
  end

  it "creates choice from an array with a hash with name and value keys" do
    expected_choice = described_class.new("large", 1)
    choice = described_class.from([{name: "large", value: 1}])

    expect(choice).to eq(expected_choice)
    expect(choice.name).to eq("large")
    expect(choice.value).to eq(1)
  end

  it "creates choice from an array with a hash without value key" do
    expected_choice = described_class.new("large", "large")
    choice = described_class.from([{name: "large"}])

    expect(choice).to eq(expected_choice)
    expect(choice.name).to eq("large")
    expect(choice.value).to eq("large")
  end

  it "creates choice from a hash with name, value and key keys" do
    default = {key: "h", name: "Help", value: :help}
    expected_choice = described_class.new("Help", :help, key: "h")
    choice = described_class.from(default)

    expect(choice).to eq(expected_choice)
    expect(choice.name).to eq("Help")
    expect(choice.value).to eq(:help)
    expect(choice.disabled?).to eq(false)
  end

  it "creates disabled choice" do
    expected_choice = described_class.new("Disabled", :none, disabled: true)
    choice = described_class.from({
      name: "Disabled",
      value: :none,
      disabled: "unavailable"
    })

    expect(choice).to eq(expected_choice)
    expect(choice.name).to eq("Disabled")
    expect(choice.value).to eq(:none)
    expect(choice.disabled?).to eq(true)
  end

  it "creates choice from an arbitrary object that responds to to_s call" do
    stub_const("Size", Class.new do
      def to_s
        "large"
      end
    end)
    size = Size.new
    expected_choice = described_class.new(size, size)
    choice = described_class.from(size)

    expect(choice).to eq(expected_choice)
    expect(choice.name).to eq(size)
    expect(choice.value).to eq(size)
    expect(choice.disabled?).to eq(false)
  end
end
