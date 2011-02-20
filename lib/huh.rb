class Huh
  V = "1.0.5"
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
  def self.assert_equal(e,a); assert(e == a); end # true == true..yes
  def self.assert_not_equal(e,a); assert(e != a); end
  def self.assert_same(e,a); assert(e.equal?(a)); end # true == true..yes
  def self.assert_not_same(e,a); assert(!e.equal?(a)); end
  def self.assert_nil(a); assert(a.nil?); end # a == nil..yes
  def self.assert_not_nil(a); assert(!a.nil?); end # a == nil..no
  def self.assert_instance_of(k,o); assert(o.instance_of?(k)); end # kind, object. object is a kind
  def self.assert_kind_of(k,o); assert(o.kind_of?(k)); end # kind, object. object is somewhat a kind
  def self.assert_match(p,s); assert(p.match(s)); end # regex matcher
  def self.assert_no_match(p,s); assert(!p.match(s)); end # regex doesnt match
  def self.assert_respond_to(m,o); assert(o.respond_to?(m)); end # you talk like that?
  def self.assert_raises(&block); assert(begin; yield; rescue; true; end); end
  def self.assert_block(&block); assert(begin;yield; rescue; false; end); end
  def self.assert_operator(a,b,o);assert(a.send(0, b)); end
  def self.assert_send(a); assert(a[0].send(a[1], *a[2..-1])); end
  def self.assert_in_delta(e,a,d); assert((e.to_f - a.to_f).abs <= d.to_f); end
  def self.assert_nothing_thrown(&block); assert(begin; yield; true; rescue; false;end); end
  def self.assert_nothing_raised(&block); assert(begin; yield;true; rescue; false;end) end
  def self.finish!;puts "\n#{oz(@t)} tests, #{oz(@a)} assertions, #{oz(@f)} failures. #{(((oz(@t)-oz(@f)).to_f/@t.to_f)*100).to_i}% passing tests"; end # spit out info
end

