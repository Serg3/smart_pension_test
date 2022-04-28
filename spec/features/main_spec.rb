# frozen_string_literal: true

require 'pry'

RSpec.shared_examples 'running app' do
  let(:exec) { File.path('app/main.rb') }

  it 'prints result' do
    result = `ruby #{exec} #{path}`
    expect(result).to eq output
  end
end

describe 'run main.rb' do
  context 'with valid path to file' do
    let(:path) { 'inbox/webserver.log' }
    let(:output) { File.read('./spec/fixtures/main/result.txt') }

    include_examples 'running app'
  end

  context 'with invalid path to file' do
    let(:path) { 'non_existent_folder/webserver.log' }
    let(:output) { "\"No such file or directory\"\n" }

    include_examples 'running app'
  end

  context 'without path to file' do
    let(:path) { nil }
    let(:output) { "\"No such file or directory\"\n" }

    include_examples 'running app'
  end
end
