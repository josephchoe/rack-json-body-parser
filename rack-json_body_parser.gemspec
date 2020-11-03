# -*- encoding: utf-8 -*-
Gem::Specification.new do |spec|
  spec.name = 'rack-json_body_parser'
  spec.version = '0.0.0'
  spec.summary = 'Rack JSON Body Parser'
  spec.description = ' '

  spec.authors = ['Joseph Choe']
  spec.email = ['joseph@josephchoe.com']
  spec.homepage = 'https://github.com/hyperluminum/rack-json-body-parser'

  spec.require_paths = ['lib']
  spec.files = Dir.glob('{lib}/**/*')
  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.6'

  spec.add_runtime_dependency 'rack'

  spec.add_development_dependency 'test_bench'

  spec.add_development_dependency 'evt-dependency'
  spec.add_development_dependency 'evt-telemetry'
end
