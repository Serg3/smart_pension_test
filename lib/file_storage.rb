# frozen_string_literal: true

class FileStorage
  def initialize(path)
    @path = path
    validation
  end

  private

  attr_reader :path

  def validation
    raise Errno::ENOENT unless path && File.file?(path)
    raise EOFError, 'File is empty' if File.empty?(path)
  end
end
