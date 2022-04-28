# frozen_string_literal: true

module Analyzer
  class BaseAnalyzer
    def initialize(logs)
      @logs = logs
    end

    private

    attr_reader :logs

    def transform(&block)
      logs.transform_values(&block)
    end

    def custom_sort(obj, sort)
      return obj.to_a if sort.empty?

      obj = obj.sort_by(&sort.keys.first)
      sort.values.first == :desc ? obj.reverse : obj
    end
  end
end
