class Huh
  class Failure < StandardError; end
  def self.test(name, &block)
    @t = oz(@t) + 1
    begin
      yield
    rescue Failure => e
      print "Testing #{name} [\033[1;49;31mFAILED\033[0m]\n"
    else 
      print "Testing #{name} [\033[1;49;32mPASSED\033[0m]\n"
    end
  end
  def self.assert(truth)
    !!truth ? (@a = oz(@a) + 1) : (@f = oz(@f) + 1; raise Failure)
  end
  def self.oz(v); v or 0; end # value or_zero
  def self.flunk; assert(false); end # always fails
  def self.assert_equal(a,b); assert(a == b); end # true == true..yes
  def self.assert_nil(a); assert(a.nil?); end # true == true..yes
  def self.finish!;puts "\n#{oz(@t)} tests, #{oz(@a)} assertions, #{oz(@f)} failures. #{(((oz(@t)-oz(@f)).to_f/@t.to_f)*100).to_i}% passing tests"; end # spit out info
end

