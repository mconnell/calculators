require "spec_helper"

RSpec.describe Calculators do
  it "has a version number" do
    expect(Calculators::VERSION).not_to be nil
  end
end
