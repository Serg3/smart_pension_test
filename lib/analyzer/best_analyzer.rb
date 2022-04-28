# frozen_string_literal: true

module Analyzer
  class BestAnalyzer < BaseAnalyzer
    def processed_urls(sort = {})
      custom_sort(transform(&:count), sort)
    end
  end
end
