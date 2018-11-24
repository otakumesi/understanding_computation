require 'set'

class NFARulebook < Struct.new(:rules)
  def alphabet
    rules.map(&:character).compact.uniq
  end

  def next_states(states, character)
    states.flat_map { |state| follow_rules_for(state, character) }.to_set
  end

  # 現在のstateがfreemoveできるのであれば
  # 可能な限りfreemove　をした集合を返す
  # freemoveができなければ、現在のstateを返す
  def follow_free_move(states)
    more_states = next_states(states, nil)

    if more_states.subset?(states)
      states
    else
      follow_free_move(more_states + states)
    end
  end

  def follow_rules_for(state, character)
    rules_for(state, character).map(&:follow)
  end

  def rules_for(state, character)
    rules.select { |rule| rule.applies_to?(state, character) }
  end
end
