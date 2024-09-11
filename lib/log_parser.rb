class LogParser
  attr_reader :path

  def initialize(path)
    @path = path
    file_exist?
  end

  def most_page_views
    show_results('visits', data_parser)
  end

  def most_unique_views
    show_results('unique visits', data_parser(uniq: true))
  end

  private

  def file_exist?
    raise "No directory provided" unless path
    raise "Wrong directory #{path}" unless File.exist?(path)
  end

  def hash_log
    @hash_log ||= loaded_file
  end

  def loaded_file
    {}.tap do |hash|
      File.open(path, "r").each do |line|
        path, ip_adress = line.split
        hash[path] ? hash[path] << ip_adress : hash[path] = [ip_adress]
      end
    end
  end

  def data_parser(uniq: false)
    hash_log.each_with_object({}) do |(key, value), hash|
      hash[key] =  uniq ? value.uniq.size : value.size
    end.sort_by { |key, value| value }.reverse.to_h
  end

  def show_results(title, hash)
    puts title
    hash.each_with_index do |(key, value), index|
      puts "#{key} -> #{value} #{title}"
      puts '-----' if index == hash.size-1
    end
  end
end