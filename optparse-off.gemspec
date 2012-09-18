Gem::Specification.new do |gem|
  gem.name          = "optparse-off"
  gem.version       = '0.0.1'
  gem.authors       = ["KITAITI Makoto"]
  gem.email         = ["KitaitiMakoto@gmail.com"]
  gem.description   = %q{Add a functionality which remove options already added to OptionParser}
  gem.summary       = %q{Add removing-option functionality to OptionParser}
  gem.homepage      = ""

  gem.files         = %w[lib/optparse/off.rb test/test_off.rb README.markdown Rakefile LICENSE.txt optparse-off.gemspec .gemtest]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
