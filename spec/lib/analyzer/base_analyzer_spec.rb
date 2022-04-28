# frozen_string_literal: true

require 'pry'
require './lib/analyzer/base_analyzer'

RSpec.shared_examples 'return result' do |method, sort|
  it 'returns a result array' do
    expect(subject.public_send(method, sort)).to eq output
  end
end

describe Analyzer::BaseAnalyzer do
end
