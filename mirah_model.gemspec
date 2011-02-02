# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'mirah_model'
  s.version = "0.0.1"
  s.authors = ["Ryan Brown"]
  s.date = Time.now.strftime("YYYY-MM-DD")
  s.description = %q{Mirah Model is a ORM library for App Engine's datastore. It is inspired by ActiveRecord and DataMapper. It's used by Dubious, a Rails-ish web framework.}
  s.email = ["ribrdb@google.com"]
  s.extra_rdoc_files = ["README.md"]

  files = Dir["{lib,test}/**/*","{*.md,Rakefile}"]
  s.files = files
  s.homepage = %q{http://www.mirah.org/}
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Mirah Model is a ORM library for App Engine's datastore.}
  #s.test_files = Dir["test/**/test*.rb"]
  s.platform = "java"
  s.add_dependency("mirah", ">= 0.0.4")
  s.add_dependency("appengine-sdk", "~> 1.4.0")  
end
