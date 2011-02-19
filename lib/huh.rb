class Huh
  class Failure < StandardError; end
  class << self
    attr_accessor :a, :t, :f
    def test(name, &block)
      @t= oz(@t) + 1
      begin
        yield
      rescue Failure => e
        print "Testing #{name} [\033[1;49;31mFAILED\033[0m]\n"
      else 
        print "Testing #{name} [\033[1;49;32mPASSED\033[0m]\n"
      end
    end
    def assert(truth)
      !!truth ? (@a = oz(@a) + 1) : (@f = oz(@f) + 1; raise Failure)
    end
    def oz(v); v or 0; end # value or_zero
    def flunk; assert(false); end # always fails
    def assert_equal(a,b); assert(a == b); end # true == true..yes
    def assert_nil(a); assert(a.nil?); end # true == true..yes
    def finish!;puts "\n#{oz(@t)} tests, #{oz(@a)} assertions, #{oz(@f)} failures. #{(((oz(@t)-oz(@f)).to_f/@t.to_f)*100).to_i}% passing tests"; end # spit out info
  end
end

