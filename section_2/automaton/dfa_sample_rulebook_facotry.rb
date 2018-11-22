class DFASampleRulebookFactory
  def self.build
    DFARulebook.new([
      FARule.new(1, 'a', 2),
      FARule.new(1, 'b', 1),
      FARule.new(2, 'a', 2),
      FARule.new(2, 'b', 3),
      FARule.new(3, 'a', 3),
      FARule.new(3, 'b', 3)
    ])
  end
end
