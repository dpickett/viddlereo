require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "viddlereo"
  gem.homepage = "http://github.com/dpickett/viddlereo"
  gem.license = "MIT"
  gem.summary = %Q{A ruby wrapper for Viddler's V2 API}
  gem.description = %Q{Viddler + Ruby = Great Video Success}
  gem.email = "dpickett@enlightsolutions.com"
  gem.authors = ["Dan Pickett"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

require 'reek/rake/task'
Reek::Rake::Task.new do |t|
  t.fail_on_error = true
  t.verbose = false
  t.source_files = 'lib/**/*.rb'
end

require 'roodi'
require 'roodi_task'
RoodiTask.new do |t|
  t.verbose = false
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new

namespace :vcr do
  desc "uses erb to replace Viddler key and password for multi developer usage"
  task :obscure_credentials do
    require File.dirname(__FILE__) + "/lib/viddlereo"
    [
      "/spec/cassettes/**/*.yml",
      "/features/cassettes/**/*.yml"
    ].each do |glob|
      Viddlereo.configuration.configure_from_yaml(File.dirname(__FILE__) + "/spec/viddlereo.yml")
      Dir.glob(File.dirname(__FILE__) + glob).each do |f|
        contents = File.read(f)
        File.open(f, "w") do |j|
          j << contents.gsub(CGI.escape(Viddlereo.key), "<%= key %>").gsub(CGI.escape(Viddlereo.password), "<%= password %>").gsub(CGI.escape(Viddlereo.user), "<%= user %>")
        end
      end
    end
  end
end
