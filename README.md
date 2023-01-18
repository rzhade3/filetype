# Filetype

Find a file type according to a filename or extension

## Installation

### Rubygems

```bash
gem install filetype
```

### GitHub

```bash
git clone https://github.com/rzhade3/filetype
gem build filetype.gemspec
gem install filetype-<version>.gem
```

## Usage

```ruby
Filetype.get('foo.rb') #=> :ruby
Filetype.all('foo.h')  #=> [:c, :cpp, :objc]
```

## Custom file types

You can add your own custom file types

```ruby
Filetype.add(:cool, %w[ cool kl ])
Filetype.get('hello.kl') #=> :cool
```

## Simple

You may notice how basic Filetype is, all it's doing is checking the file name
or file extension. Well, that's its intention, it was built for nothing more.
If you want more advanced information, check out the
[mime-types](https://rubygems.org/gems/mime-types) library.

## Contributing

The list of file types Filetype supports can be found
[here](lib/filetype.rb#L6).
Please feel free to add file types!