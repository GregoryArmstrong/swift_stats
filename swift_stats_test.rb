require 'minitest/autorun'
require 'minitest/pride'

require_relative 'swift_stats'

class SwiftStatsTest < Minitest::Test

  def test_swift_stats_can_pull_in_file_and_read
    s = SwiftStats.new('lyrics.txt')

    assert_equal String, s.swift_lines.class
  end

  def test_swift_stats_can_sanitize_swift_lines
    s = SwiftStats.new('lyrics.txt')
    s.sanitize_swift

    refute s.swift_lines.include?(',')
    refute s.swift_lines.include?('?')
    refute s.swift_lines.include?('!')
    refute s.swift_lines.include?('.')
    refute s.swift_lines.include?('(')
    refute s.swift_lines.include?(')')
  end

  def test_swift_stats_creates_array_and_elminates_duplicates
    s = SwiftStats.new('lyrics.txt')
    s.sanitize_swift
    s.unique_swift

    assert_equal 1, s.swift_lines.count("love")
    assert_equal 1, s.swift_lines.count("mine")
    assert_equal 1, s.swift_lines.count("pain")
  end

  def test_swift_stats_returns_unique_count
    s = SwiftStats.new('lyrics.txt')
    s.sanitize_swift
    s.unique_swift

    assert_equal 2066, s.count_swift
  end

end
