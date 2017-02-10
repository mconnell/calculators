require 'bigdecimal'

module Calculators
  module Mortgage
    class Repayment
      def initialize(principal:, payment:, rate:)
        @principal = principal
        @payment = payment
        @rate = rate
      end

      def payment
        @payment
      end

      def interest
        (@principal * @rate * 1).ceil(2)
      end

      def deduction
        @payment - interest
      end

      def principal
        amount = (@principal - deduction).ceil(2)
        amount.negative? ? BigDecimal.new("0.00") : amount
      end
    end
  end
end
