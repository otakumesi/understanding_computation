class NFA < Struct.new(:current_states, :accept_states, :rulebook)
  def read_string(string)
    string.chars.each do |character|
      read_character(character)
    end
  end

  def read_character(character)
    self.current_states = rulebook.next_states(current_states, character)
  end

  # 現在のstateをfreemove済みの状態を含めた集合に変換する
  def current_states
    rulebook.follow_free_move(super)
  end

  def accepting?
    (current_states & accept_states).any?
  end
end
