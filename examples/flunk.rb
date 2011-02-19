require File.dirname(__FILE__) + "/../lib/huh"

class Test < Huh
  
  test "flunk should always fail" do
    flunk 
  end
 
  finish!

end
