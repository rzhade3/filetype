require 'test_helper'

class FileTypeTest < TestCase

  test 'testing all languages with all extensions' do
    assert_equal :bundler, Filetype.get('Gemfile')
    assert_equal :bundler, Filetype.get('gemfile') # ?
    assert_equal :bundler, Filetype.get('Gemfile.lock') # ?
    assert_equal :bundler, Filetype.get('gemfile.lock') # ?
    assert_equal :make, Filetype.get('Makefile')
    assert_equal :make, Filetype.get('makefile')
    assert_equal :rake, Filetype.get('Rakefile')
    assert_equal :rake, Filetype.get('rakefile')

    assert_equal :actionscript, Filetype.get('foo.as')
    assert_equal :actionscript, Filetype.get('foo.mxml')
    assert_equal :ada, Filetype.get('foo.ada')
    assert_equal :ada, Filetype.get('foo.adb')
    assert_equal :ada, Filetype.get('foo.ads')
    assert_equal :asm, Filetype.get('foo.asm')
    assert_equal :asm, Filetype.get('foo.s') # ?
    assert_equal :asm, Filetype.get('foo.s')
    assert_equal :batch, Filetype.get('foo.bat')
    assert_equal :batch, Filetype.get('foo.cmd')
    assert_equal :c, Filetype.get('foo.c')
    assert_equal :c, Filetype.get('foo.h')
    assert_equal :clojure, Filetype.get('foo.clj')  
    assert_equal :cpp, Filetype.get('foo.cpp')
    assert_equal :cpp, Filetype.get('foo.cc') 
    assert_equal :cpp, Filetype.get('foo.cxx') 
    assert_equal :cpp, Filetype.get('foo.m') 
    assert_equal :cpp, Filetype.get('foo.hpp') 
    assert_equal :cpp, Filetype.get('foo.hh') 
    assert_equal :cpp, Filetype.get('foo.h') 
    assert_equal :cpp, Filetype.get('foo.hxx') 
    assert_equal :csharp, Filetype.get('foo.cs')  
    assert_equal :css, Filetype.get('foo.css')  
    assert_equal :elisp, Filetype.get('foo.el')  
    assert_equal :erlang, Filetype.get('foo.erl')
    assert_equal :erlang, Filetype.get('foo.hrl')
    assert_equal :go, Filetype.get('foo.go')
    assert_equal :groovy, Filetype.get('foo.groovy')
    assert_equal :groovy, Filetype.get('foo.gpp')
    assert_equal :groovy, Filetype.get('foo.grunit')
    assert_equal :groovy, Filetype.get('foo.gtmpl')
    assert_equal :haskell, Filetype.get('foo.hs')
    assert_equal :haskell, Filetype.get('foo.lhs')
    assert_equal :haml, Filetype.get('foo.haml')  
    assert_equal :html, Filetype.get('foo.html')     
    assert_equal :html, Filetype.get('foo.xhtml')
    assert_equal :html, Filetype.get('foo.shtml')
    assert_equal :html, Filetype.get('foo.htm')
    assert_equal :java, Filetype.get('foo.java')  
    assert_equal :java, Filetype.get('foo.jar')  
    assert_equal :js, Filetype.get('foo.js')
    assert_equal :lisp, Filetype.get('foo.lisp')   
    assert_equal :lisp, Filetype.get('foo.lsp')
    assert_equal :lua, Filetype.get('foo.lua')  
    assert_equal :objc, Filetype.get('foo.m')   # DUPLICATE
    assert_equal :objc, Filetype.get('foo.h')   # DUPLICATE
    assert_equal :ocaml, Filetype.get('foo.ml')
    assert_equal :ocaml, Filetype.get('foo.mli')   
    assert_equal :perl, Filetype.get('foo.pl')
    assert_equal :perl, Filetype.get('foo.pm')
    assert_equal :perl, Filetype.get('foo.t')
    assert_equal :perl, Filetype.get('foo.pod')
    assert_equal :php, Filetype.get('foo.php')
    assert_equal :php, Filetype.get('foo.phpt')
    assert_equal :php, Filetype.get('foo.phtml')    
    assert_equal :python, Filetype.get('foo.py')   
    assert_equal :python, Filetype.get('foo.pyc')
    assert_equal :rackup, Filetype.get('foo.ru')  
    assert_equal :ruby, Filetype.get('foo.rb')
    assert_equal :ruby, Filetype.get('foo.rhtml')
    assert_equal :ruby, Filetype.get('foo.erb')
    assert_equal :ruby, Filetype.get('foo.rake')
    assert_equal :ruby, Filetype.get('foo.rjs')
    assert_equal :sass, Filetype.get('foo.sass')  
    assert_equal :scala, Filetype.get('foo.scala')
    assert_equal :scss, Filetype.get('foo.scss')  
    assert_equal :scheme, Filetype.get('foo.scm')
    assert_equal :scheme, Filetype.get('foo.ss')
    assert_equal :shell, Filetype.get('foo.sh')
    assert_equal :shell, Filetype.get('foo.bash')
    assert_equal :shell, Filetype.get('foo.ksh')
    assert_equal :shell, Filetype.get('foo.zsh')
    assert_equal :shell, Filetype.get('foo.csh')
    assert_equal :smalltalk, Filetype.get('foo.st')
    assert_equal :sql, Filetype.get('foo.sql')
    assert_equal :sql, Filetype.get('foo.ctl')
    assert_equal :yaml, Filetype.get('foo.yaml')
    assert_equal :yaml, Filetype.get('foo.yml') 
    assert_equal :xml, Filetype.get('foo.xml')
    assert_equal :xml, Filetype.get('foo.xsl')
    assert_equal :xml, Filetype.get('foo.dtd')
    assert_equal :xml, Filetype.get('foo.xslt')     
  end

  test 'fetching multiple languages of a file name' do
    assert_equal [:c, :cpp, :objc], Filetype.all('foo.h')
    assert_empty Filetype.all('foo.aahaha')
  end

  test 'adding filetypes' do
    Filetype.add(:bar, %w/foo bar/)
    assert_equal :bar, Filetype.get('hello.foo')
  end

end