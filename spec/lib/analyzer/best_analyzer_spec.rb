# frozen_string_literal: true

require 'pry'
require './lib/analyzer/best_analyzer'

describe Analyzer::BestAnalyzer do
  subject { described_class.new(logs) }
  let(:logs) { JSON.parse(File.read('./spec/fixtures/analyzer/logs.json')) }

  describe '#processed_urls' do
    context 'correct list' do
      let(:output) { [['/about', 5], ['/help_page/1', 3], ['/about/2', 2], ['/index', 2]] }

      include_examples 'return result', :processed_urls, { last: :desc }
    end

    context 'empty sort' do
      let(:output) { [['/help_page/1', 3], ['/index', 2], ['/about/2', 2], ['/about', 5]] }

      include_examples 'return result', :processed_urls, {}
    end
  end
end
