require "huh"

class Test < Huh
  
  test "flunk should always fail" do
    flunk 
  end
 
  finish!

end
