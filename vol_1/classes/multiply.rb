class Multiply < Struct.new(:left, :right)
  def to_s
    "#{left} * #{right}"
  end

  def inspect
    "<<#{self}>>"
  end

  def reduceible?
    true
  end

  def reduce(environment)
    if left.reduceible?
      Multiply.new(left.reduce(environment), right)
    elsif right.reduceible?
      Multiply.new(left, right.reduce(environment))
    else
      Number.new(left.value * right.value)
    end
  end
end
