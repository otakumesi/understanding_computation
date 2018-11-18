class Add < Struct.new(:left, :right)
  def to_s
    "#{left} + #{right}"
  end

  def inspect
    "<<#{self}>>"
  end

  def reduceible?
    true
  end

  def reduce(environment)
    if left.reduceible?
      Add.new(left.reduce(environment), right)
    elsif right.reduceible?
      Add.new(left, right.reduce(environment))
    else
      Number.new(left.value + right.value)
    end
  end
end
