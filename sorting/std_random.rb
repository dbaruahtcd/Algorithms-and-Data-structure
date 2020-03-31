require_relative '../spec_helper'
require_relative 'sort_helper'

# in iteration i, generate random number between i and length of array.
class StdRandom
  def initialize(arr)
    @arr = arr 
  end
  
  def knuths_shuffle
    len = @arr.length
    for i in (0...len) do
      random = rand(i...len)
      exch(@arr, i, random)
    end
  end
end