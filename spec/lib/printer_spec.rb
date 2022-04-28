# frozen_string_literal: true

require 'pry'
require './lib/printer'

describe Printer do
  describe '.print' do
    let(:result) { [['/about/2', 90], ['/contact', 89], ['/index', 82]] }
    let(:console_output) { File.read('./spec/fixtures/printer/result.txt') }

    it 'prints result' do
      expect { described_class.print(result) }.to output(console_output).to_stdout
    end
  end

  describe '.custom_message' do
    it 'prints text' do
      expect { described_class.custom_message('123') }.to output("\"123\"\n").to_stdout
    end
  end
end
