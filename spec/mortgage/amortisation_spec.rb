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

      it "has a payment value of 644.31" do
        expect(subject.payment).to eq(BigDecimal.new("644.31"))
      end
    end

    context "35 year mortgage for 200,000 at 3.74%" do
      let(:number_of_payments) { 420 }
      let(:principal) { BigDecimal.new("200000") }
      let(:rate) { BigDecimal.new("3.74") }

      it "has a payment value of 854.64" do
        expect(subject.payment).to eq(BigDecimal.new("854.64"))
      end
    end
  end

  describe "#schedule" do
    context "1 year mortgage for 10000, at 6%" do
      let(:number_of_payments) { 12 }
      let(:principal) { BigDecimal.new("10000") }
      let(:rate) { BigDecimal.new("6") }

      it "has a schedule of 12 payments" do
        expect(subject.schedule.length).to eq(12)
      end

      describe "1st repayment" do
        let(:repayment) { subject.schedule[0] }

        it "includes the repayment amount of 860.67" do
          expect(repayment.amount).to eq(BigDecimal.new("860.67"))
        end

        it "includes interest of 50.00" do
          expect(repayment.interest).to eq(BigDecimal.new("50.00"))
        end

        it "includes a deduction from the principal of 810.67" do
          expect(repayment.deduction).to eq(BigDecimal.new("810.67"))
        end

        it "includes an updated principal value of 9189.33" do
          expect(repayment.principal).to eq(BigDecimal.new("9189.33"))
        end
      end

      describe "5th repayment" do
        let(:repayment) { subject.schedule[4] }

        it "includes the repayment amount of 860.67" do
          expect(repayment.amount).to eq(BigDecimal.new("860.67"))
        end

        it "includes interest of 33.67" do
          expect(repayment.interest).to eq(BigDecimal.new("33.67"))
        end

        it "includes a deduction from the principal of 827.00" do
          expect(repayment.deduction).to eq(BigDecimal.new("827.00"))
        end

        it "includes an updated principal value of 5905.93" do
          expect(repayment.principal).to eq(BigDecimal.new("5905.93"))
        end
      end

      describe "12th repayment" do
        let(:repayment) { subject.schedule[11] }

        it "includes the repayment amount of 860.67" do
          expect(repayment.amount).to eq(BigDecimal.new("860.67"))
        end

        it "includes interest of 4.29" do
          expect(repayment.interest).to eq(BigDecimal.new("4.29"))
        end

        it "includes a deduction from the principal of 856.38" do
          expect(repayment.deduction).to eq(BigDecimal.new("856.38"))
        end

        it "includes an updated principal value of 0.00" do
          expect(repayment.principal).to eq(BigDecimal.new("0.00"))
        end
      end
    end
  end
end
