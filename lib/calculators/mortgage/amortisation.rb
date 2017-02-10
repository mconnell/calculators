require 'bigdecimal'
require 'ostruct'

module Calculators
  module Mortgage
    class Amortisation
      def initialize(principal:, number_of_payments:, rate:)
        @principal = principal
        @number_of_payments = number_of_payments
        @rate = rate
      end

      def payment
        amount = @principal * ((monthly_rate * exponent) / (exponent - 1))
        amount.ceil(2)
      end

      def schedule
        moving_principal = @principal
        (1..@number_of_payments).map do
          repayment = Repayment.new(
            principal: moving_principal,
            payment: payment,
            rate: monthly_rate
          )
          moving_principal = repayment.principal
          repayment
        end
      end

      private

      def monthly_rate
        @rate / 100 / 12
      end

      def exponent
        (1 + monthly_rate) ** @number_of_payments
      end
    end
  end
end
