# begin
#   require_dependency 'application_controller'
# rescue MissingSourceFile
#   require_dependency 'application'
# end
# require 'rack/utils'

# require 'action_controller/test_process'
# require 'action_controller/integration'
require 'rspec'
require 'active_support/test_case'
require 'active_record/fixtures' if defined?(ActiveRecord::Base)

# require 'spec/test/unit'

# require 'spec/rails/matchers'
# require 'spec/rails/mocks'
# require 'spec/rails/example'
require 'spec/rails/extensions'
# require 'spec/rails/interop/testcase'

require 'spec/rails/harness'

RSpec::Core::Example.send(:include, RSpec::Rails::Harness)

Test::Unit.run = true

# Spec::Example::ExampleGroupFactory.default(ActiveSupport::TestCase)

# if ActionView::Base.respond_to?(:cache_template_extensions)
#   ActionView::Base.cache_template_extensions = false
# end

