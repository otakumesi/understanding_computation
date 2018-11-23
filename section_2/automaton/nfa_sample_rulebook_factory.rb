class NFASampleRulebookFactory
  def self.build
    NFARulebook.new([
      FARule.new(1, 'a', 1),
      FARule.new(1, 'b', 1),
      FARule.new(1, 'b', 2),
      FARule.new(2, 'a', 3),
      FARule.new(2, 'b', 3),
      FARule.new(3, 'a', 4),
      FARule.new(3, 'b', 4)
    ])
  end

  def self.build_for_freemove
    NFARulebook.new([
      FARule.new(1, nil, 2),
      FARule.new(1, nil, 4),
      FARule.new(2, 'a', 3),
      FARule.new(3, 'a', 2),
      FARule.new(4, 'a', 5),
      FARule.new(5, 'a', 6),
      FARule.new(6, 'a', 4)
    ])
  end
end
