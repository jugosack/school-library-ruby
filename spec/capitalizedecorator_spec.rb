require 'minitest/autorun'
require_relative '../decorator'
require_relative '../capitalizedecorator'

class CapitalizeDecoratorTest < Minitest::Test
  class FakeNameable
    def correct_name
      "jane doe"
    end
  end

  def test_correct_name_capitalizes_wrapped_object
    fake_nameable = FakeNameable.new
    capitalize_decorator = CapitalizeDecorator.new(fake_nameable)

    assert_equal "Jane doe", capitalize_decorator.correct_name
  end
end