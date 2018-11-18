class Machine < Struct.new(:expression, :environment)
  def step
    self.expression = expression.reduce(environment)
  end

  def run
    while expression.reduceible?
      puts expression
      step
    end
    puts expression
  end
end
