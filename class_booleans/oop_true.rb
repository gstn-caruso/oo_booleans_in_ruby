require_relative 'oop_boolean'

class OOPTrue < OOPBoolean
  def and a_block
    a_block.call
  end

  def or a_block
    self
  end
end