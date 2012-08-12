require 'optparse'

class OptionParser
  def off(short_option=nil, long_option=nil)
    sw = make_switch([short_option, long_option])
    sw[1].each do |so|
      top.short.delete so
    end
    sw[2].each do |lo|
      top.long.delete lo
    end
    top.list.delete_if do |switch|
      switch.short.delete short_option
      switch.long.delete long_option
      switch.short.empty? && switch.long.empty?
    end
  end
end
