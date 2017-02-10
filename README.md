# Calculators

A while back I built a Mortgage calculator (https://github.com/mconnell/mortgage / http://mortgage-calc.herokuapp.com) for comparing rent prices to a variety of mortages at aggressive interest levels.

More recently, I've been more interested in [amortisation](https://en.wikipedia.org/wiki/Amortization) schedules. This was me just going through the motions of understanding how to calculate an amortisation schedule.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'calculators', :git => 'https://github.com/mconnell/calculators'
```

## Usage

This library assumes that values are supplied as BigDecimal objects.

```ruby
  # loan of 100,000, over 25 years (300 payments), at 3.74% interest rate:
  amortisation = Calculators::Mortgage::Amortisation.new(
    number_of_payments: 300,
    principal: BigDecimal.new("100000.00"),
    rate: BigDecimal.new("3.74")
  )

  amortisation.schedule
```
