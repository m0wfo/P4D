Gem::Specification.new do |s|
  s.name = %q{p4d}
  s.version = "0.0.1"
  s.authors = ["Chris Mowforth"]
  s.email = ["chris@mowforth.com"]
  s.summary = "P4D Shipping API Library"
  s.description = <<-EOF
    A Ruby wrapper for the P4D Shipping API
  EOF
  s.files = Dir.glob("{test}/**/*") | Dir.glob("{lib}/**/*")
  s.has_rdoc = true
  spec.add_dependency("httparty", ">= 0.4.4")
  spec.add_dependency("php-serialize", ">= 1.1.0")
end