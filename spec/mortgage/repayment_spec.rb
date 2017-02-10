require "spec_helper"

RSpec.describe Calculators::Mortgage::Repayment do
  describe ".new" do
    context "repayment of 500.00 on a 10000.00 loan at 0.5%" do
      let(:principal) { BigDecimal.new("10000") }
      let(:rate)      { BigDecimal.new("0.005") }
      let(:payment)   { BigDecimal.new("500.00") }

      subject { described_class.new(principal: principal, rate: rate, payment: payment) }

      it "has a payment of 500.00" do
        expect(subject.payment).to eq(BigDecimal.new("500.00"))
      end

      it "has an interest payment of 50.00" do
        expect(subject.interest).to eq(BigDecimal.new("50.00"))
      end

      it "has a deduction from the principal of 450.00" do
        expect(subject.deduction).to eq(BigDecimal.new("450.00"))
      end

      it "has a principal value of 9550.00, after payment + interest" do
        expect(subject.principal).to eq(BigDecimal.new("9550.00"))
      end
    end

    context "repayment of 500.00 on a 400.00 loan at 0.5%" do
      let(:principal) { BigDecimal.new("400.00") }
      let(:rate)      { BigDecimal.new("0.005") }
      let(:payment)   { BigDecimal.new("500.00") }

      subject { described_class.new(principal: principal, rate: rate, payment: payment) }

      it "has an adjusted payment of 402.00" do
        expect(subject.payment).to eq(BigDecimal.new("402.00"))
      end

      it "has an interest payment of 2.00" do
        expect(subject.interest).to eq(BigDecimal.new("2.00"))
      end

      it "has a deduction from the principal of 400.00" do
        expect(subject.deduction).to eq(BigDecimal.new("400.00"))
      end

      it "has a principal value of 0.00, after payment + interest" do
        expect(subject.principal).to eq(BigDecimal.new("0.00"))
      end
    end
  end
end
