class NFASimulation < Struct.new(:nfa_design)
  def next_states(state, character)
    design = nfa_design.to_nfa(state).tap do |state|
      state.read_character(character)
    end
    design.current_states
  end

  def rules_for(state)
    nfa_design.rulebook.alphabet.map do |character|
      FARule.new(state, character, next_states(state, character))
    end
  end

  def discover_states_and_rules(states)
    rules = states.flat_map { |state| rules_for(state) }
    more_states = rules.map(&:follow).to_set

    if more_states.subset?(states)
      [states, rules]
    else
      discover_states_and_rules(states + more_states)
    end
  end

  def to_dfa_design
    start_state = nfa_design.to_nfa.current_states
    states, rules = discover_states_and_rules(start_state)
    accept_states = states.select { |state| nfa_design.to_nfa(state).accepting? }

    DFADesign.new(start_state, accept_states, DFARulebook.new(rules))
  end
end
