# frozen_string_literal: true

class FileStorage
  def initialize(path)
    @path = path
    @lines = []
    validation
  end

  def url_with_ips
    read_valid_entries
  end

  private

  # regex could be improved for valid IP addresses
  REGEX = %r(^(?:/[^/\s]+)+\s+(?:[0-9]{1,3}\.){3}[0-9]{1,3}$)

  attr_reader :path, :lines

  def validation
    raise Errno::ENOENT unless path && File.file?(path)
    raise EOFError, 'File is empty' if File.empty?(path)
  end

  def read_valid_entries
    IO.foreach(path) { |line| lines << line.chomp.split(' ') if line[REGEX] }
    lines.group_by(&:shift).transform_values(&:flatten)
  end
end
