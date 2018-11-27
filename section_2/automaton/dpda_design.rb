class DPDADesign < Struct.new(:start_state, :bottom_character, :accept_states, :rulebook)
  def accepts?(string)
    to_dpda.tap { |dpda| dpda.read_string(string) }.accepting?
  end

  def to_dpda
    start_stack = Stack.new([bottom_character])
    start_config = PDAConfiguration.new(start_state, start_stack)
    DPDA.new(start_config, accept_states, rulebook)
  end
end
