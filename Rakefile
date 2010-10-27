require 'rubygems'
require 'rake/gempackagetask'
require 'rubygems/specification'
require 'date'
require 'spec/rake/spectask'
require 'cucumber/rake/task'



spec = eval(File.read("mixlib-localization.gemspec"))

task :default => :spec

desc "Run specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(-fs --color)
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "install the gem locally"
task :install => [:package] do
  sh %{gem install pkg/mixlib-localization-#{MIXLIB_LOCALIZATION_VERSION}}
end

desc "create a gemspec file"
task :make_spec do
  File.open("mixlib-localization.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

desc "Generate a well formed text file with existing messages in English"
task :generate_messages do
  require File.expand_path(File.dirname(__FILE__) + '/lib/mixlib/localization/messages')
  Mixlib::Localization::Messages.generate_message_text_file("en_us", File.expand_path(File.dirname(__FILE__) + '/messages'))
end

Cucumber::Rake::Task.new(:features) do |t|
  t.profile = "default"
end

desc "remove build files"
task :clean do
  sh %Q{ rm -f pkg/*.gem }
end

desc "Run the spec and features"
task :test => [ :features, :spec ]
