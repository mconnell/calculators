require 'bigdecimal'

module Calculators
  module Mortgage
    class Repayment
      def initialize(principal:, payment:, rate:)
        @principal = principal
        @payment = payment
        @rate = rate

        adjust_payment_if_greater_than_outstanding_balance
      end

      def payment
        if @payment <= @principal + interest
          @payment
        else
          @principal + interest
        end
      end

      def interest
        (@principal * @rate).ceil(2)
      end

      def deduction
        @payment - interest
      end

      def principal
        (@principal - deduction).ceil(2)
      end

      private

      def adjust_payment_if_greater_than_outstanding_balance
        outstanding_balance = (@principal + interest)
        if outstanding_balance < @payment
          @payment = outstanding_balance
        end
      end
    end
  end
end
