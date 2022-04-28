# frozen_string_literal: true

class Printer
  class << self
    def print(obj = [])
      obj.each { |line| p "#{line.first} has #{line.last} visits." }
    end

    def custom_message(text)
      p text
    end
  end
end
