require_relative "lib/tty2/prompt/version"

Gem::Specification.new do |spec|
  spec.name          = "tty2-prompt"
  spec.version       = TTY2::Prompt::VERSION
  spec.authors       = ["zzyzwicz"]
  spec.email         = ["zzyzwicz@lo0.mx"]
  spec.summary       = %q{A beautiful and powerful interactive command line prompt.}
  spec.description   = %q{A beautiful and powerful interactive command line prompt with a robust API for getting and validating complex inputs.}
  spec.homepage      = "https://github.com/zzyzwicz/tty2-prompt"
  spec.license       = "MIT"
  if spec.respond_to?(:metadata=)
    spec.metadata = {
      "allowed_push_host" => "https://rubygems.org",
      "bug_tracker_uri"   => "https://github.com/zzyzwicz/tty2-prompt/issues",
      "changelog_uri"     => "https://github.com/zzyzwicz/tty2-prompt/blob/master/CHANGELOG.md",
      "documentation_uri" => "https://www.rubydoc.info/gems/tty2-prompt",
      "homepage_uri"      => spec.homepage,
      "source_code_uri"   => "https://github.com/zzyzwicz/tty2-prompt"
    }
  end
  spec.files         = Dir["lib/**/*"]
  spec.extra_rdoc_files = Dir["README.md", "CHANGELOG.md", "LICENSE.txt"]
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.0.0"

  spec.add_dependency "pastel",     "~> 0.8"
  spec.add_dependency "tty2-reader", "~> 0.9.0.3"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0"
end
