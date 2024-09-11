require_relative 'lib/log_parser'

arg = ARGV[0]

log_parser = LogParser.new(arg)

log_parser.most_page_views
log_parser.most_unique_views
