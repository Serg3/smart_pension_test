# frozen_string_literal: true

module Analyzer
  class UniqAnalyzer < BaseAnalyzer
    def processed_urls(sort = {})
      custom_sort(transform { |ip| ip.uniq.count }, sort)
    end
  end
end
