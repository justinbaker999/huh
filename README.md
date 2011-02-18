Intro
=========

A tiny(<30 lines) library for unit testing

Install
=========

    sudo gem install huh

or from source

    git clone git://github.com/justinbaker/huh.git
    cd huh
    rake
    gem install huh-1.0.0.gem

Usage
=========

    class PostTest < Huh
    
      test "should_not_save" do
        @post = Post.new 
        assert !@post.save
      end

    end

Assertions
============

The current list of assertions available:

- assert(a): expects a to be true 
- assert_equal(a, b): expects a == b
- assert_nil(a): expects a == nil
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
