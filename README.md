Intro
=========

A tiny(<40 lines) library for unit testing

Install
=========

    sudo gem install huh

or from source

    git clone git://github.com/justinbaker/huh.git
    cd huh
    rake
    gem install huh-1.0.7.gem

Usage
=========

    class PostTest < Huh
    
      test "should_not_save" do
        @post = Post.new 
        assert !@post.save
      end

      finish!

    end

Don't forget the finish!; it prints out number of tests, assertions, failures, as well as percentage of passing tests.

Running tests from `irb` or `rails console`
=============================================

Just require huh, and call Huh#run with all test files as an argument.

    require "huh"
    Huh.run(Dir.glob("examples/*.rb"))

Assertions
============

The current list of assertions available:

- assert(a): expects a to be true 
- assert_equal(a, b): expects a == b
- assert_not_equal(a, b): expects a != b
- assert_same(a, b): expects a.equal?(b)
- assert_not_same(a, b): expects !a.equal?(b)
- assert_nil(a): expects a == nil
- assert_not_nil(a): expects a != nil
- assert_instance_of(t, o): expects o.instance_of?(t)
- assert_kind_of(t, o): expects o.kind_of?(t)
- assert_match(p,s): expects p.match(s)
- assert_no_match(p,s): expects !p.match(s)
- assert_respond_to(m,o): expects o.respond_to?(m)
- assert_raises(block): expects block.call to raise an error
- assert_block(block): expects block.call to return true
- assert_send(array): expects array[0].send(array[1], array[REST OF ARRAY])
- assert_in_delta(e,a,d): expects e-a to be less than or equal to d
- assert_nothing_thrown(block): expects block to throw nothing
- assert_nothing_raised(block): expects block to raise nothing
- flunk: fails always

License
===========
Copyright (c) 2010 Justin baker

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
