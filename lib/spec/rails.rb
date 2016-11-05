# begin
#   require_dependency 'application_controller'
# rescue MissingSourceFile
#   require_dependency 'application'
# end
# require 'rack/utils'

# require 'action_controller/test_process'
# require 'action_controller/integration'
require 'active_support/test_case'
require 'active_record/fixtures' if defined?(ActiveRecord::Base)

# require 'spec/test/unit'

# require 'spec/rails/matchers'
# require 'spec/rails/mocks'
# require 'spec/rails/example'
require 'spec/rails/extensions'
# require 'spec/rails/interop/testcase'

Test::Unit::TestCase.send(:include, RSpec::Matchers)
Test::Unit.run = true

RSpec.configure do |c|
  c.expose_current_running_example_as :example

  c.before(:each) do
    def example.testunit_test
      example_name = SecureRandom.hex
      @testunit_test ||= Class.new(ActiveRecord::TestCase) do
        define_method(example_name.to_sym) {}
      end.new(example_name)
    end

    example.testunit_test.run_callbacks(:setup)
    example.testunit_test.setup
  end

  c.after(:each) do
    example.testunit_test.teardown
    example.testunit_test.run_callbacks(:teardown)
  end
end

# Spec::Example::ExampleGroupFactory.default(ActiveSupport::TestCase)

# if ActionView::Base.respond_to?(:cache_template_extensions)
#   ActionView::Base.cache_template_extensions = false
# end

