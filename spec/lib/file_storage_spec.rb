# frozen_string_literal: true

require 'pry'
require './lib/file_storage'

RSpec.shared_examples 'file validator' do |error|
  it 'raises an error' do
    expect { subject }.to raise_error(error)
  end
end

describe FileStorage do
  let(:path) { './spec/fixtures/file_storage/webserver.log' }
  subject { described_class.new(path) }

  describe '#validation' do
    let(:output) { nil }

    context 'with path to existing file' do
      it 'returns an instance' do
        expect(subject).to be_instance_of(FileStorage)
      end
    end

    context 'with path to empty file' do
      let(:path) { './spec/fixtures/file_storage/webserver_empty.log' }

      include_examples 'file validator', EOFError
    end

    context 'with path to non-existing file' do
      let(:path) { 'path/to/webserver.log' }

      include_examples 'file validator', Errno::ENOENT
    end

    context 'with empty path to file' do
      let(:path) { '' }

      include_examples 'file validator', Errno::ENOENT
    end

    context 'without path to file' do
      let(:path) { nil }
      let(:output) { 'Please provide a path to file.' }

      include_examples 'file validator', Errno::ENOENT
    end
  end

  describe '#url_with_ips' do
    let(:output) do
      { '/contact' => ['184.123.665.067'], '/help_page/1' => ['126.318.035.038'], '/home' => ['184.123.665.067'] }
    end

    it 'returns a list url-ips' do
      expect(subject.url_with_ips).to eq output
    end
  end
end
