require 'minitest/autorun'
require_relative '../decorator'
require_relative '../trimmerdecorator'

class TrimmerDecoratorTest < Minitest::Test
  class FakeNameable
    def initialize(name)
      @name = name
    end

    def correct_name
      @name
    end
  end

  def test_correct_name_trims_name_if_longer_than_11_characters
    fake_nameable = FakeNameable.new("The quick brown fox jumps over the lazy dog")
    trimmer_decorator = TrimmerDecorator.new(fake_nameable)

    assert_equal "The quick ...", trimmer_decorator.correct_name
  end

  def test_correct_name_does_not_trim_name_if_shorter_than_10_characters
    fake_nameable = FakeNameable.new("jane doe")
    trimmer_decorator = TrimmerDecorator.new(fake_nameable)

    assert_equal "jane doe", trimmer_decorator.correct_name
  end
end