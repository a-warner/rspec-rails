module RSpec
  module Rails
    module Harness
      def self.included(base)
        RSpec.configure do |c|
          c.before(:each) do |example|
            example.testunit_test.run_callbacks(:setup)
            example.testunit_test.setup
          end

          c.after(:each) do |example|
            example.testunit_test.teardown
            example.testunit_test.run_callbacks(:teardown)
          end
        end
      end

      def testunit_test
        @testunit_test ||=
          begin
            example_name = SecureRandom.hex
            Class.new(ActiveRecord::TestCase) do
              define_method(example_name.to_sym) {}
            end.new(example_name)
          end
      end
    end
  end
end
