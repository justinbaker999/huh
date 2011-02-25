class Huh

  VERSION = "1.0.6"

  class Failure < StandardError; end

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

  def self.setup(&block)
    @setup = block
  end

  def self.teardown(&block)
    @teardown = block
  end

  def self.assert(truth)
    @setup.call if @setup
    !!truth ? (@assertions = oz(@assertions) + 1) : (@failures = oz(@failures) + 1; raise Failure)
    @teardown.call if @teardown
  end

  def self.oz(value)
    value or 0
  end 

  def self.flunk
    assert false
  end 

  def self.assert_equal(expected, actual)
    assert expected == actual
  end 

  def self.assert_not_equal(expected, actual)
    assert expected != actual
  end

  def self.assert_same(expected, actual)
    assert expected.equal?(actual)
  end 

  def self.assert_not_same(expected, actual)
    assert !expected.equal?(actual)
  end

  def self.assert_nil(value)
    assert value.nil?
  end

  def self.assert_not_nil(value)
    assert !value.nil? 
  end 

  def self.assert_instance_of(type, object)
   assert object.instance_of?(type)
  end 

  def self.assert_kind_of(kind, object)
    assert object.kind_of?(kind)
  end 

  def self.assert_match(pattern, string)
    assert pattern.match(string)
  end

  def self.assert_no_match(pattern, string)
    assert !pattern.match(string)
  end 

  def self.assert_respond_to(meth, object)
    assert object.respond_to?(meth)
  end 

  def self.assert_raises(&block)
    assert(begin; yield; rescue; true; end)
  end

  def self.assert_block(&block)
    assert(begin;yield; rescue; false; end)
  end

  def self.assert_operator(a,b,operator)
    assert a.send(operator, b) 
  end

  def self.assert_send(send_array)
    assert send_array[0].send(send_array[1], *send_array[2..-1])
  end

  def self.assert_in_delta(expected, actual, delta)
    assert (expected.to_f - actual.to_f).abs <= delta.to_f
  end

  def self.assert_nothing_thrown(&block)
    assert(begin; yield; true; rescue; false;end)
  end

  def self.assert_nothing_raised(&block)
    assert(begin; yield;true; rescue; false;end)
  end

  def self.finish!
    percentage = ((( oz(@tests) - oz(@failures) ).to_f / @tests.to_f) * 100 ).to_i
    print "\n#{oz(@tests)} tests, #{oz(@assertions)} assertions, #{oz(@failures)} failures."
    print "#{percentage}% passing tests}\n"
  end

end

