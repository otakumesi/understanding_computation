class Number < Struct.new(:value)
  def to_s
    value.to_s
  end

  def inspect
    "<<#{self}>>"
  end

  # スモールステップ意味論
  def reducible?
    false
  end

  # ビッグステップ意味論
  def evaluate(environment)
    self
  end

  # 表示的意味論
  def to_ruby
    "-> e { #{value.inspect} }"
  end
end
