require_relative 'oop_boolean'

class OOPFalse < OOPBoolean
  def and a_block
    self
  end

  def or a_block
    a_block.call
  end
end