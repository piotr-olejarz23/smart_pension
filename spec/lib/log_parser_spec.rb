require_relative '../spec_helper'

RSpec.describe LogParser do
  subject { described_class.new(path) }
  let(:path) { 'webserver.log' }

  describe 'initialized without path' do
    let(:path) { nil }

    it 'raises a no directory error' do
      expect { subject }.to raise_error(RuntimeError, "No directory provided")
    end
  end

  describe 'initialized with wrong path' do
    let(:path) { 'bad_path.log' }

    it 'raises a wrong directory error' do
      expect { subject }.to raise_error(RuntimeError, "Wrong directory #{path}")
    end
  end

  describe '#most_page_views' do
    let(:expected_hash) do
      {
        '/about/2' => 90,
        '/contact'=> 89,
        '/index'=> 82,
        '/about'=> 81,
        '/help_page/1'=> 80,
        '/home'=> 78
      }
    end

     it "return correct data" do
      expect(subject.most_page_views).to eq(expected_hash)
    end
  end

  describe '#most_unique_views' do
    let(:expected_hash) do
      {
        '/about' => 21,
        '/about/2'=> 22,
        '/contact'=> 23,
        '/help_page/1'=> 23,
        '/home'=> 23,
        '/index'=> 23,
      }
    end

    it "return correct data" do
      expect(subject.most_unique_views).to eq(expected_hash)
    end
end
end