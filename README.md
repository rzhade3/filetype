Filetype
========

Find a file type according to a filename or extension

Installation
------------

### Rubygems

    gem install filetype

### GitHub

    git clone git://github.com/injekt/filetype.git
    gem build filetype.gemspec
    gem install filetype-<version>.gem

Usage
-----

    Filetype.get('foo.rb') #=> :ruby
    Filetype.all('foo.h')  #=> [:c, :cpp, :objc]

Custom file types
-----------------

You can of course add your own custom file types

    Filetype.add(:cool, %w[ cool kl ])
    Filetype.get('hello.kl') #=> :cool

Contributing
------------

The list of file types Filetype supports can be found
[here](https://github.com/injekt/filetype/blob/master/lib/filetype.rb#L6).
This list is of course fairly short. Please feel free to add file types!