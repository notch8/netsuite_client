# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{netsuite_client}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Vlad Jebelev"]
  s.date = %q{2010-07-07}
  s.description = %q{Ruby soap4r-based Netsuite client.}
  s.email = ["vlad@jebelev.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "TODO", "lib/netsuite_client.rb", "lib/netsuite_client/client.rb", "lib/netsuite_client/netsuite_exception.rb", "lib/netsuite_client/netsuite_result.rb", "lib/netsuite_client/soap_netsuite.rb", "lib/netsuite_client/string.rb", "netsuite_client.gemspec", "test/test_helper.rb", "test/test_netsuite_client.rb"]
  s.homepage = %q{http://rubygems.org/gems/netsuite_client}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{netsuiteclient}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby soap4r-based Netsuite client.}
  s.test_files = ["test/test_netsuite_client.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.3.3"])
    else
      s.add_dependency(%q<hoe>, [">= 2.3.3"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.3.3"])
  end
end
