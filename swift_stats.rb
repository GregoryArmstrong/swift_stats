class SwiftStats

  attr_accessor :swift_lines

  def initialize(file)
    @swift_lines = File.read(file)
  end

  def sanitize_swift
    @swift_lines.tr!("\n", " ")
    @swift_lines.delete!("?!,.()/")
    @swift_lines.downcase!
  end

  def unique_swift
    @swift_lines = swift_lines.split(" ")
    @swift_lines.uniq!
  end

  def count_swift
    @swift_lines.count
  end

end
