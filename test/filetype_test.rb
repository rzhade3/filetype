require 'test_helper'

class FileTypeTest < TestCase

  test 'fetching the language of a file name' do
    assert_equal :ruby, Filetype.get('foo.rb')
    assert_nil Filetype.get('foo.abahaha')
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