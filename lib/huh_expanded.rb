# Huh is a small unit testing library
# It supports many assertions commonly used, and has no external dependencies.
#
# Author:: Justin Baker (mailto:bakermoto@gmail.com)       
# Copyright:: Copyright (c) 2010 Justin Baker
# License::   MIT license

# This class creates a new test case. Your test classes should inherit from this class.
# 
# Example
#   class MyTest < Huh
#     test "the truth" do
#       assert true
#     end
#   end
#
# You can do almost anything you do with Test::Unit included in the standard library, or MiniTest.
# For all of the assertions, see README.md or examples/all_assertions for usage.
#
#
class Huh

  VERSION = "1.0.8" unless defined?(VERSION) #:nodoc:

  # The error thrown from a failing test
  #
  class Failure < StandardError; end

  # The method used for creating a new test
  #  
  # Example
  #   class PostTest < Huh
  #     test "create_new_post_and_save" do
  #       assert Post.new.save
  #     end
  #   end
  #
  def self.test(name, &block)
    @tests = oz(@tests) + 1
    begin
      yield
    rescue Failure => e
      print "Testing #{name} [\033[1;49;31mFAILED\033[0m]\n"
    else 
      print "Testing #{name} [\033[1;49;32mPASSED\033[0m]\n"
    end
  end

  # runs a block before every test
  #  
  # Example
  #   class PostTest < Huh
  #     setup do
  #       @post = Post.new
  #     end
  #     test "create_new_post_and_save" do
  #       assert @post.save
  #     end
  #   end
  #
  def self.setup(&block)
    @setup = block
  end

  # runs a block after every test
  #  
  # Example
  #   class PostTest < Huh
  #     teardown do
  #       @post = nil
  #     end
  #     test "create_new_post_and_save" do
  #       @post = Post.new
  #       assert @post.save
  #     end
  #   end
  #
  def self.teardown(&block)
    @teardown = block
  end
  
  # validates that a condition is true
  #
  # Example
  #   class PostTest < Huh
  #     test "create_new_post_and_save" do
  #       @post = Post.new
  #       assert @post.save
  #     end
  #   end
  #
  def self.assert(truth)
    @setup.call if @setup
    !!truth ? (@assertions = oz(@assertions) + 1) : (@failures = oz(@failures) + 1; raise Failure)
    @teardown.call if @teardown
  end
  
  # return value if it isn't zero
  #
  def self.oz(value)
    value or 0
  end 

  # assertion that ALWAYS fails
  #
  def self.flunk
    assert false
  end 

  # validate that actual == expected
  #
  def self.assert_equal(expected, actual)
    assert expected == actual
  end 

  # validate that actual != expected
  #
  def self.assert_not_equal(expected, actual)
    assert expected != actual
  end

  # validate that expected.equal?(actual)
  #
  def self.assert_same(expected, actual)
    assert expected.equal?(actual)
  end 

  # validate that !expected.equal?(actual)
  #
  def self.assert_not_same(expected, actual)
    assert !expected.equal?(actual)
  end

  # validate that value.nil?
  #
  def self.assert_nil(value)
    assert value.nil?
  end

  # validate that !value.nil?
  #
  def self.assert_not_nil(value)
    assert !value.nil? 
  end 

  # validate that object.instance_of?(type)
  #
  def self.assert_instance_of(type, object)
   assert object.instance_of?(type)
  end 

  # validate that object.kind_of?(type)
  #
  def self.assert_kind_of(kind, object)
    assert object.kind_of?(kind)
  end 

  # validate that pattern.match(string)
  #
  def self.assert_match(pattern, string)
    assert pattern.match(string)
  end

  # validate that !pattern.match(string)
  #
  def self.assert_no_match(pattern, string)
    assert !pattern.match(string)
  end 

  # validate that object.respond_to?(meth)
  #
  def self.assert_respond_to(meth, object)
    assert object.respond_to?(meth)
  end 
  
  # validate that the block raises an error
  #
  def self.assert_raises(&block)
    assert(begin; yield; rescue; true; end)
  end
  
  # validate that the block returns true
  #
  def self.assert_block(&block)
    assert(begin;yield; rescue; false; end)
  end
  
  # validate that the block returns true when operator is called on it with value
  #
  def self.assert_operator(object, value,operator)
    assert object.send(operator, value) 
  end

  # validate that send_array[0] returns true when send_array[1] is called on it with the rest of send_array as args  
  #
  def self.assert_send(send_array)
    assert send_array[0].send(send_array[1], *send_array[2..-1])
  end

  # validate that actual is less than delta away from expected
  #
  def self.assert_in_delta(expected, actual, delta)
    assert (expected.to_f - actual.to_f).abs <= delta.to_f
  end
 
  # validate that nothing is thrown by the block
  #
  def self.assert_nothing_thrown(&block)
    assert(begin; yield; true; rescue; false;end)
  end

  # validate that no errors are raised by the block
  #
  def self.assert_nothing_raised(&block)
    assert(begin; yield;true; rescue; false;end)
  end

  # print out statistics of test 
  #
  def self.finish!
    percentage = ((( oz(@tests) - oz(@failures) ).to_f / @tests.to_f) * 100 ).to_i
    print "\n#{oz(@tests)} tests, #{oz(@assertions)} assertions, #{oz(@failures)} failures."
    print "#{percentage}% passing tests}\n"
  end

  # use in irb/rails console to run tests
  #
  def self.run(files)
    puts "\nrunning tests from #{t}\n"
    files.each do |file|
      require file 
    end
  end

end

