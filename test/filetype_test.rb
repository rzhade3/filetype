require 'test_helper'

class FileTypeTest < TestCase

  test 'testing all languages with all extensions' do
    assert_filetype 'Gemfile', :bundler
    assert_filetype 'gemfile', :bundler
    assert_filetype 'Gemfile.lock', :bundler
    assert_filetype 'gemfile.lock', :bundler
    assert_filetype 'Makefile', :make
    assert_filetype 'makefile', :make
    assert_filetype 'Rakefile', :rake
    assert_filetype 'rakefile', :rake
    assert_filetype 'Rakefile.rb', :rake
    assert_filetype 'foo.as', :actionscript
    assert_filetype 'foo.mxml', :actionscript
    assert_filetype 'foo.ada', :ada
    assert_filetype 'foo.adb', :ada
    assert_filetype 'foo.ads', :ada
    assert_filetype 'foo.asm', :asm
    assert_filetype 'foo.s', :asm
    assert_filetype 'foo.bat', :batch
    assert_filetype 'foo.cmd', :batch
    assert_filetype 'foo.c', :c
    assert_filetype 'foo.h', :c
    assert_filetype 'foo.clj', :clojure  
    assert_filetype 'foo.cpp', :cpp
    assert_filetype 'foo.cc', :cpp 
    assert_filetype 'foo.cxx', :cpp 
    assert_filetype 'foo.m', :cpp 
    assert_filetype 'foo.hpp', :cpp 
    assert_filetype 'foo.hh', :cpp 
    assert_filetype 'foo.h', :cpp 
    assert_filetype 'foo.hxx', :cpp 
    assert_filetype 'foo.cs', :csharp  
    assert_filetype 'foo.css', :css  
    assert_filetype 'foo.el', :elisp  
    assert_filetype 'foo.erl', :erlang
    assert_filetype 'foo.hrl', :erlang
    assert_filetype 'foo.go', :go
    assert_filetype 'foo.groovy', :groovy
    assert_filetype 'foo.gpp', :groovy
    assert_filetype 'foo.grunit', :groovy
    assert_filetype 'foo.gtmpl', :groovy
    assert_filetype 'foo.hs', :haskell
    assert_filetype 'foo.lhs', :haskell
    assert_filetype 'foo.haml', :haml  
    assert_filetype 'foo.html', :html     
    assert_filetype 'foo.xhtml', :html
    assert_filetype 'foo.shtml', :html
    assert_filetype 'foo.htm', :html
    assert_filetype 'foo.java', :java  
    assert_filetype 'foo.jar', :java  
    assert_filetype 'foo.js', :js
    assert_filetype 'foo.lisp', :lisp   
    assert_filetype 'foo.lsp', :lisp
    assert_filetype 'foo.lua', :lua  
    assert_filetype 'foo.m', :objc
    assert_filetype 'foo.h', :objc
    assert_filetype 'foo.ml', :ocaml
    assert_filetype 'foo.mli', :ocaml   
    assert_filetype 'foo.pl', :perl
    assert_filetype 'foo.pm', :perl
    assert_filetype 'foo.t', :perl
    assert_filetype 'foo.pod', :perl
    assert_filetype 'foo.php', :php
    assert_filetype 'foo.phpt', :php
    assert_filetype 'foo.phtml', :php    
    assert_filetype 'foo.py', :python   
    assert_filetype 'foo.pyc', :python
    assert_filetype 'foo.ru', :rackup  
    assert_filetype 'foo.rb', :ruby
    assert_filetype 'foo.rhtml', :ruby
    assert_filetype 'foo.erb', :ruby
    assert_filetype 'foo.rake', :ruby
    assert_filetype 'foo.rjs', :ruby
    assert_filetype 'foo.sass', :sass  
    assert_filetype 'foo.scala', :scala
    assert_filetype 'foo.scss', :scss  
    assert_filetype 'foo.scm', :scheme
    assert_filetype 'foo.ss', :scheme
    assert_filetype 'foo.sh', :shell
    assert_filetype 'foo.bash', :shell
    assert_filetype 'foo.ksh', :shell
    assert_filetype 'foo.zsh', :shell
    assert_filetype 'foo.csh', :shell
    assert_filetype 'foo.st', :smalltalk
    assert_filetype 'foo.sql', :sql
    assert_filetype 'foo.ctl', :sql
    assert_filetype 'foo.yaml', :yaml
    assert_filetype 'foo.yml', :yaml 
    assert_filetype 'foo.xml', :xml
    assert_filetype 'foo.xsl', :xml
    assert_filetype 'foo.dtd', :xml
    assert_filetype 'foo.xslt', :xml     
  end

  test 'fetching multiple languages of a file name' do
    assert_equal [:c, :cpp, :objc], Filetype.all('foo.h')
    assert_empty Filetype.all('foo.aahaha')
  end

  test 'adding filetypes' do
    Filetype.add(:bar, %w/foo bar/)
    assert_equal Filetype.get('hello.foo'), :bar
  end

end