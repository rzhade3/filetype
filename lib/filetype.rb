module Filetype
  VERSION = '0.0.1'

  # When an array is given, the "de facto" one should be at index 0
  FTYPES = {
    :actionscript => %w[ as mxml ],
    :ada          => %w[ ada adb ads ],
    :asm          => %w[ asm s ],
    :batch        => %w[ bat cmd ],
    :bundler      => /\A[Gg]emfile(?:\.lock)?\z/,
    :c            => %w[ c h ],
    :clojure      => %w[ clj ],
    :cpp          => %w[ cpp cc cxx m hpp hh h hxx ],
    :csharp       => %w[ cs ],
    :css          => %w[ css ],
    :elisp        => %w[ el ],
    :erlang       => %w[ erl hrl ],
    :go           => %w[ go ],
    :groovy       => %w[ groovy gpp grunit gtmpl ],
    :haskell      => %w[ hs lhs ],
    :haml         => %w[ haml ],
    :html         => %w[ html xhtml shtml htm ],
    :java         => %w[ java ],
    :js           => %w[ js ],
    :lisp         => %w[ lisp lsp ],
    :lua          => %w[ lua ],
    :make         => /\A[Mm]akefile\z/,
    :objc         => %w[ m h ],
    :ocaml        => %w[ ml mli ],
    :perl         => %w[ pl pm t pod ],
    :php          => %w[ php phpt phtml ],
    :python       => %w[ py pyc ],
    :rackup       => %w[ ru ],
    :rake         => /\A[Rr]akefile(?:.rb)?\z/,
    :ruby         => %w[ rb rhtml erb rake rjs ],
    :sass         => %w[ sass ],
    :scala        => %w[ scala ],
    :scss         => %w[ scss ],
    :scheme       => %w[ scm ss ],
    :shell        => %w[ sh bash ksh zsh csh ],
    :smalltalk    => %w[ st ],
    :sql          => %w[ sql ctl ],
    :yaml         => %w[ yaml yml ],
    :xml          => %w[ xml xsl dtd xslt ]
  }

  # Fetch a language for this filetype
  #
  # @param [String] fname The file name to check
  # @example
  #   Filetype.get('foo.rb')   #=> :ruby
  #   Filetype.get('Rakefile') #=> :rake
  # @return [Symbol] The language found or nil
  def self.get(fname)
    FTYPES.find { |ftype, rule| check_type(fname, ftype, rule) }.first
  end

  # Fetch a list of possible languages which match this filetype
  #
  # @param [String] fname The file name to check
  # @example
  #   Filetype.all('foo.h') #=> [:c, :cpp, :objc]
  # @return [Array] The list of languages found
  def self.all(fname)
    FTYPES.select { |ftype, rule| check_type(fname, ftype, rule) }.keys
  end

  # Add a file type and rule
  #
  # @param [Symbol] ftype The file type
  # @param [Object] rule  The rule to match
  # @example
  #   Filetype.add(:foo, ['foo', 'bar'])
  #   Filetype.get('hello.bar') #=> :foo
  #
  #   Filetype.add(:bar, /\Ahello/)
  #   Filetype.get('hellofoo') #=> :bar
  def self.add(ftype, rule)
    FTYPES[ftype] = rule
  end

  private

  def self.check_type(fname, ftype, rule)
    case rule
    when Array
      ext = File.extname(fname)[1..-1]
      ftype if rule.include?(ext)
    when Regexp
      ftype if fname.match(rule)
    when String, Symbol
      ftype if fname == rule.to_s
    else
      nil
    end
  end
end
