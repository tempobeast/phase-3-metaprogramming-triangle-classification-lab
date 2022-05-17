require 'pry'

class Triangle

  attr_reader :kind, :sides

  def initialize(first_side, second_side, third_side)
    @sides = []
    @sides.push(first_side, second_side, third_side)
    @sides.sort

    @first_side = first_side
    @second_side = second_side
    @third_side = third_side

  end

  def sort_sides
    @sides.sort
  end

  def kind
    if self.sort_sides.each {|side| side > 0} && self.sort_sides[0] + self.sort_sides[1] > self.sort_sides[2]
      if @first_side == @second_side && @first_side == @third_side && @first_side > 0
        :equilateral
      elsif @first_side == @second_side || @second_side == @third_side || @third_side == @first_side
        :isosceles
      elsif @first_side != @second_side && @second_side != @third_side && @third_side != @first_side
        :scalene
      end
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end

end
