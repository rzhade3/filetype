require 'test_helper'

class NewGemTest < TestCase

  test 'fetching the language of a file name' do
    assert_equal :ruby, Filetype.get('foo.rb')
    assert_nil Filetype.get('foo.abahaha')
  end

  test 'fetching multiple languages of a file name' do
    assert_equal [:c, :cpp, :objc], Filetype.all('foo.h')
    assert_empty Filetype.all('foo.aahaha')
  end

end