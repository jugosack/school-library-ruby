require 'minitest/autorun'
require_relative '../decorator'

class DecoratorTest < Minitest::Test
  class FakeNameable
    def correct_name
      'John Smith'
    end
  end

  def test_correct_name
    fake_nameable = FakeNameable.new
    decorator = Decorator.new(fake_nameable)
    assert_equal 'John Smith', decorator.correct_name
  end
end
