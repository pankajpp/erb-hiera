require "optimist"

module ErbHiera
  module CLI
    def self.parse
      p = Optimist::Parser.new do
        opt :config,       "specify config file", :type => :string
        opt :hiera_config, "specify hiera config file", :type => :string
        opt :verbose,      "print compiled templates"
        opt :debug,        "print backtrace on error"
        opt :dry_run,      "don't write out files"
        opt :no_fork,      "disable forking copies of erb-hiera for each entry in the config"
      end

      options = Optimist::with_standard_exception_handling(p) do
        # show help if no cli args are provided
        raise Optimist::HelpNeeded if ARGV.empty?

        p.parse ARGV
      end

      # validate cli args
      raise ArgumentError, "config file not specified" unless options[:config_given]
      raise ArgumentError, "config file not readable"  unless File.readable?(options[:config])

      raise ArgumentError, "hiera config file not specified" unless options[:hiera_config_given]
      raise ArgumentError, "hiera config file not readable"  unless File.readable?(options[:hiera_config])

      options
    rescue => error
      puts error
      puts error.backtrace if options[:debug]
      exit 1
    end
  end
end
