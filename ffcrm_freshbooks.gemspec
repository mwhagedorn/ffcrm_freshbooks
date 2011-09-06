# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "ffcrm_freshbooks"
  s.summary = "Insert FfcrmFreshbooks summary."
  s.description = "Insert FfcrmFreshbooks description."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"

  s.add_runtime_dependency("freshbooks", [">= 2.2.1"])
end