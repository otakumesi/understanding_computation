class NFASimulation < Struct.new(:nfa_design)
  def next_states(state, character)
    design = nfa_design.to_nfa(state).tap do |state|
      state.read_character(character)
    end
    design.current_states
  end
end
