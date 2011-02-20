require File.dirname(__FILE__) + "/../lib/huh"

class Test < Huh
  
  test "the truth" do
    assert true
  end
 
  test "the power of equality" do
    assert_equal "me", "me"
  end
 
  test "the power of inequality" do
    assert_not_equal "me", "you"
  end

  test "nil yo" do
    assert_nil nil
  end  

  test "not nil yo" do
    assert_not_nil true
  end  

  test "everything is a class" do
    assert_instance_of Fixnum, 1
  end
 
  test "everything is a class" do
    assert_kind_of Fixnum, 1
  end

  test "love match" do
    assert_match /love/, "love"
  end

  test "no_love_match" do
    assert_no_match /love/, "loner"
  end  

  test "respond_to?" do
    assert_respond_to :gsub, "hello"
  end 

  test "should get pissed" do
    assert_raises do
      raise "WHAT THE FUCK"
    end
  end

  test "should be true" do
    assert_block do
      "dfg"
    end
  end
 
  finish!

end
