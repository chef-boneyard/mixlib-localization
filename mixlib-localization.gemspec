MIXLIB_LOCALIZATION_VERSION = "1.0.1"

Gem::Specification.new do |s|
  s.name = "mixlib-localization"
  s.version = MIXLIB_LOCALIZATION_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.rdoc", "LICENSE", 'NOTICE']
  s.summary = "Helper for error messages"
  s.description = s.summary
  s.author = "Opscode, Inc."
  s.email = "info@opscode.com"
  s.homepage = "http://www.opscode.com"
  
  # Uncomment this to add a dependency
  s.add_dependency "mixlib-log"
  
  s.require_path = 'lib'
  s.files = %w(LICENSE README.rdoc Rakefile NOTICE) + Dir.glob("{lib,spec,features}/**/*")
end