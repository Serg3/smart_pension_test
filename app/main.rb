# frozen_string_literal: true

require 'pry'
require_relative '../lib/analyzer/base_analyzer'
require_relative '../lib/analyzer/best_analyzer'
require_relative '../lib/analyzer/uniq_analyzer'
require_relative '../lib/file_storage'
require_relative '../lib/printer'

def exit_with_notice(message)
  p message
  exit
end

def main(path_to_logs)
  begin
    storage = FileStorage.new(path_to_logs).url_with_ips
  rescue Errno::ENOENT, EOFError => error
    exit_with_notice(error.message)
  end

  best_analyzer = Analyzer::BestAnalyzer.new(storage)
  uniq_analyzer = Analyzer::UniqAnalyzer.new(storage)

  Printer.custom_message('Descending URLs visits:')
  Printer.print(best_analyzer.processed_urls(last: :desc))
  Printer.custom_message('-----------------------')
  Printer.custom_message('Descending unique entries:')
  Printer.print(uniq_analyzer.processed_urls(last: :desc))
end

main(ARGV.first)
