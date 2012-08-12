OptionParser#off
================

Add a functionality which remove options already added to OptionParser.

Installation
------------

Add this line to your application's Gemfile:

    gem 'optparse-off'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install optparse-off

Usage
-----

    require 'optparse/off'
    
    opts = OptionParser.new
    opts.on '-n'
    opts.off '-n'
    opts.parse '-n' #=> invalid option: -n (OptionParser::InvalidOption)

Use case
--------

Let you use a simple framework for command-line applications.

    # command.rb
    require 'optparse'
    
    class Command
      def initialize
        @opts = OptionParser.new
        @opts.on '--dry-run' do |switch|
          @dry_run = switch
        end
      end
      
      def run
        @opts.parse!
      end
    end

And then create a command to report something, offing `--dry-run' option:

    # report.rb
    require 'optparse/off'
    require 'command'

    # This class don't need `--dry-run' option
    class Report < Command
      def initialize
        super
        
        # Add an additional option specified to this command
        @opts.on '--notifier=NOTIFIER', [:email, :irc, :and_so_on] do |notifier|
          @notifier = notifiler
        end
        
        # Off the `--dry-run' option
        @opts.off '--dry-run'
      end
      
      def run
        super
        # process reporting
      end
    end

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
