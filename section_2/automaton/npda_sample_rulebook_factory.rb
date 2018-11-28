class NPDASampleRulebookFactory
  def self.build
    NPDARulebook.new([
      PDARule.new(1, 'a', 1, '$', ['a', '$']),
      PDARule.new(1, 'a', 1, 'a', ['a', 'a']),
      PDARule.new(1, 'a', 1, 'b', ['a', 'b']),
      PDARule.new(1, 'b', 1, '$', ['b', '$']),
      PDARule.new(1, 'b', 1, 'b', ['b', 'b']),
      PDARule.new(1, 'b', 1, 'a', ['b', 'a']),
      PDARule.new(1, nil, 2, '$', ['$']),
      PDARule.new(1, nil, 2, 'a', ['a']),
      PDARule.new(1, nil, 2, 'b', ['b']),
      PDARule.new(2, 'a', 2, 'a', []),
      PDARule.new(2, 'b', 2, 'b', []),
      PDARule.new(2, nil, 3, '$', ['$'])
    ])
  end
end
