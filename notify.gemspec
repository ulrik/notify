# This is just so that the source file can be loaded.
module ::Motion; module Project; class Config
  def self.variable(*); end
end; end; end

require 'date'
$:.unshift File.expand_path('../lib', __FILE__)
require 'notify/version'


Gem::Specification.new do |spec|
  spec.name        = "notify"
  spec.version     = Notify::VERSION
  spec.date        = Date.today
  spec.authors     = ["Jacob Glasdam", "Ulrik Hardt Schønnemann"]
  spec.email       = ["info@medware.dk"]
  spec.summary     = %q{...}
  spec.description = %q{...}
  spec.homepage    = "http://www.medware.dk"
  spec.license     = "MIT"
  spec.files       = Dir.glob('lib/**/*.rb') << 'README.md' << 'LICENSE.txt'

  spec.add_development_dependency 'rake'
  spec.add_dependency "motion-require", ">= 0.0.6"
end

