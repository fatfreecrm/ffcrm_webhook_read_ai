# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

Gem::Specification.new do |gem|
  gem.name = 'ffcrm_webhook_read_ai'
  gem.authors = ["Daniel O'Connor"]
  gem.summary = 'Fat Free CRM'
  gem.description = 'An open source, Ruby on Rails customer relationship management platform'
  gem.homepage = 'http://fatfreecrm.com'
  gem.email = ['daniel.oconnor@gmail.com']
  gem.files = Dir['{app,config,db,lib,vendor,public,bin,log/script}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md',
                  'config.ru', 'CHANGELOG.md', 'CONTRIBUTING.md']
  gem.version = ''
  gem.required_ruby_version = '>= 3.1'
  gem.license = 'MIT'

  gem.add_dependency 'ffcrm_endpoint'
end
