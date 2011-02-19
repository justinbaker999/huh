require "huh"

class PostTest < Huh
  
  test "post_should_not_save" do
    @post = Post.new
    assert !@post.save
  end

  test "post_should_not_save_without_title" do
    @post = Post.new(:content = "Lorem blah blah..")
    assert !@post.save
  end

  test "post_should_save" do
    @post = Post.new(:content = "Lorem blah blah..", :title => "My First Post")
    assert @post.save
  end  
 
  test "post_should_be_published" do
    @post = Post.first
    assert @post.published?
  end  

  test "post_should_not_be_published" do
    @post = Post.last
    assert @post.published?
  end
 
  finish!

end
