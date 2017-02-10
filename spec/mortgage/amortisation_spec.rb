require "spec_helper"

RSpec.describe Calculators::Mortgage::Amortisation do
  subject do
    described_class.new(
      number_of_payments: number_of_payments,
      principal: principal,
      rate: rate
    )
  end

  describe "#payment" do
    context "10 year mortgage for 50,000 at 2%" do
      let(:number_of_payments) { 120 }
      let(:principal) { BigDecimal.new("50000") }
      let(:rate) { BigDecimal.new("2") }

      it "has a payment value of 460.07" do
        expect(subject.payment).to eq(BigDecimal.new("460.07"))
      end
    end

    context "25 year mortgage for 100,000 at 6%" do
      let(:number_of_payments) { 300 }
      let(:principal) { BigDecimal.new("100000") }
      let(:rate) { BigDecimal.new("6") }

      it "has a payment value of 644.30" do
        expect(subject.payment).to eq(BigDecimal.new("644.30"))
      end
    end

    context "35 year mortgage for 200,000 at 3.74%" do
      let(:number_of_payments) { 420 }
      let(:principal) { BigDecimal.new("200000") }
      let(:rate) { BigDecimal.new("3.74") }

      it "has a payment value of 854.63" do
        expect(subject.payment).to eq(BigDecimal.new("854.63"))
      end
    end
  end
end
