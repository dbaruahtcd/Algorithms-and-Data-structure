=begin
Given an array of numbers (in string format), you must return a string. The numbers correspond to the letters of the alphabet
in reverse order: a=26, z=1 etc. You should also account for '!', '?' and ' '
that are represented by '27', '28' and '29' respectively.
=end
require '../../spec_helper'

def switcher(arr)
  alphabets = ('a'..'z').to_a.reverse
  ['!', '?'].each do |s|
    alphabets << s
  end

  str = ''
  arr.each do |a|
    if a == '29'
      str += ' '
    else
      str += alphabets[a.to_i - 1]
    end
  end
  str
end

assert_equal(switcher(['24', '12', '23', '22', '4', '26', '9', '8']), 'codewars')
assert_equal(switcher(['25','7','8','4','14','23','8','25','23','29','16','16','4']), 'btswmdsbd kkw')
assert_equal(switcher(['4', '24']), 'wc')
assert_equal(switcher(['12']), 'o')
assert_equal(switcher(['12','28','25','21','25','7','11','22','15']), 'o?bfbtpel' )