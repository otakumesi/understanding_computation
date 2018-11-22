class DFA < Struct.new(:current_state, :accept_states, :rule_book)
  def read_string(string)
    string.chars.each do |character|
      read_character(character)
    end
  end

  def read_character(character)
    self.current_state = rule_book.next_state(current_state, character)
  end

  def accepting?
    accept_states.include?(current_state)
  end
end
