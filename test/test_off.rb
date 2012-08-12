gem 'test-unit'
require 'test/unit'
require 'optparse/off'

class TestOptionParserOff < Test::Unit::TestCase
  def setup
    @opt = OptionParser.new
  end

  data 'single short', {
    :def_opts => %w[-n],
    :off_opts => %w[-n],
    :argv     => %w[-n],
    :expected => OptionParser::InvalidOption
  }
  data 'single short, single long, short arg', {
    :def_opts => %w[-n --lines],
    :off_opts => %w[-n],
    :argv     => %w[-n],
    :expected => OptionParser::InvalidOption
  }
  data 'single short, single long, off short, long arg', {
    :def_opts => %w[-n --lines],
    :off_opts => %w[-n],
    :argv     => %w[--lines],
    :expected => {'lines' => true}
  }
  data 'single short, single long, off short, short arg', {
    :def_opts => %w[-n --lines],
    :off_opts => %w[-n],
    :argv     => %w[-n],
    :expected => OptionParser::InvalidOption
  }
  data 'single short, single long, off long, long arg', {
    :def_opts => %w[-n --lines],
    :off_opts => %w[--lines],
    :argv     => %w[--lines],
    :expected => OptionParser::InvalidOption
  }
  data 'single short, single long, off both, long arg', {
    :def_opts => %w[-n --lines],
    :off_opts => %w[-n --lines],
    :argv     => %w[--lines],
    :expected => OptionParser::InvalidOption
  }
  def test_opt_off(data)
    @opt.def_option *data[:def_opts]
    @opt.off *data[:off_opts]
    if data[:expected].kind_of?(Class) and data[:expected] < Exception
      assert_raise data[:expected] do
        @opt.parse data[:argv]
      end
    else
      assert_equal data[:expected], @opt.getopts(data[:argv])
    end
  end
end

