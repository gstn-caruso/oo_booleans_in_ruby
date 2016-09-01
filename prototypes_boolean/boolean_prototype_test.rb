require 'minitest/autorun'
#require 'minitest/reporters'

#MiniTest::Reporters.use!

class OOPBooleanTest < Minitest::Test

  def setup

    @oop_true = Object.new
    class << @oop_true
      def or a_block
        self
      end

      def and a_block
        a_block.call
      end
    end

    @oop_false = Object.new
    class << @oop_false
      def or a_block
        a_block.call
      end

      def and a_block
        self
      end
    end

    @an_expression = proc { 2+2 }
    @expression_evaluated = @an_expression.call
  end

  ## When I am true

  def test_when_i_am_true_if_i_receive_the_and_message_i_evaluate_the_expression
    current = @oop_true.and @an_expression

    assert_equal @expression_evaluated, current
  end

  def test_when_i_am_true_if_i_receive_the_or_message_i_returns_myself
    current = @oop_true.or @an_expression

    assert_oop_true current
  end

  # When I am false

  def test_when_i_am_false_if_i_receive_the_and_message_i_returns_myself
    current = @oop_false.and @an_expression

    assert_oop_false current
  end

  def test_when_i_am_false_if_i_receive_the_or_message_i_evaluate_the_expression
    current = @oop_false.or @an_expression

    assert_equal @expression_evaluated, current
  end


  private

  def assert_oop_true something
    assert_equal something, @oop_true
  end

  def assert_oop_false something
    assert_equal something, @oop_false
  end

end
