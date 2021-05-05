
# Greatest common divisor of two numbers does not change if the larger number is replaced by
# its difference with the smaller number.


def sum_differences_between_products_and_LCMs(pairs)
  result = 0
  pairs.each do |pair|
    product = pair.inject(:*)
    lcm = product/gcd(pair.first, pair.last)
    result += product - lcm
  end
  result
end


def gcd(a, b)
  return b if a == 0
  return a if b == 0
  if a > b
    gcd(a-b, b)
  else
    gcd(a, b-a)
  end
end

# puts gcd(15, 18)

pairs = [[15,18], [4,5], [12,60]]
puts sum_differences_between_products_and_LCMs(pairs)