require 'optparse' 

module Redcat
  class CLI
    def run
      opts = {}
      opts[:redis_url] = ENV['REDIS_URL']

      ARGV.options do |o|
        o.banner = 'Usage: redcat [options] <file>'
        o.on('-u', '--url URL', 'redis url') { |url| opts[:redis_url] = url }
        o.on('-l', '--list LIST', 'redis list') { |list| opts[:redis_list] = list }
        o.parse!

        abort('Error: -u not specified or REDIS_URL not set in ENV') unless opts[:redis_url]
        abort('Error: -l not specified') unless opts[:redis_list]
        
        file = ARGV.shift
        io = file.nil? ? ARGF : File.open(file)
        rc = Redcat::Catter.new(opts)
        io.each_line { |l| rc.cat(l) }
      end
    end
  end
end
