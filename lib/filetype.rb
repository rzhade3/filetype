module Filetype
  module_function

  VERSION = '1.2.1'

  FTYPES = {
    :actionscript => %w[ as mxml ],
    :ada          => %w[ ada adb ads ],
    :asm          => %w[ asm s ],
    :batch        => %w[ bat cmd ],
    :bundler      => /\A[Gg]emfile(?:\.lock)?\z/,
    :bzip         => %w[ bzip2 bzip ],
    :c            => %w[ c h ],
    :clojure      => %w[ clj ],
    :cpp          => %w[ cpp cc cxx m hpp hh h hxx ],
    :csharp       => %w[ cs ],
    :css          => %w[ css ],
    :diff         => %w[ diff patch ],
    :docker       => /\A[Dd]ockerfile(?:\.\w+)?\z/,
    :elisp        => %w[ el ],
    :epub         => %w[ epub ],
    :erb          => %w[ rhtml erb ],
    :erlang       => %w[ erl hrl ],
    :exe          => %w[ exe ],
    :forth        => %w[ 4th ],
    :fsharp       => %w[ fs ],
    :gem          => %w[ gem ],
    :go           => %w[ go ],
    :groovy       => %w[ groovy gpp grunit gtmpl ],
    :gzip         => %w[ gzip gz ],
    :haskell      => %w[ hs lhs ],
    :haml         => %w[ haml ],
    :html         => %w[ html xhtml shtml htm ],
    :java         => %w[ java jar ],
    :js           => %w[ js ],
    :json         => %w[ json ],
    :lisp         => %w[ lisp lsp ],
    :lua          => %w[ lua ],
    :make         => /\A[Mm]akefile\z/,
    :objc         => %w[ m h ],
    :ocaml        => %w[ ml mli ],
    :pcap         => %w[ pcap ],
    :perl         => %w[ pl pm t pod ],
    :pgp          => %w[ asc pgp gpg ],
    :php          => %w[ php phpt phtml ],
    :python       => %w[ py pyc ],
    :rackup       => %w[ ru ],
    :rake         => /\A[Rr]akefile(?:.rb)?\z/,
    :rar          => %w[ rar ],
    :ruby         => %w[ rb rake gemspec rjs ],
    :sass         => %w[ sass ],
    :scala        => %w[ scala ],
    :scss         => %w[ scss ],
    :scheme       => %w[ scm ss ],
    :shell        => %w[ sh bash ksh zsh csh ],
    :smalltalk    => %w[ st ],
    :sql          => %w[ sql ctl ],
    :tar          => %w[ tar ],
    :text         => %w[ txt ],
    :toml         => %w[ toml ],
    :yaml         => %w[ yaml yml ],
    :xml          => %w[ xml dtd ],
    :xsl          => %w[ xsl xslt],
    :zip          => %w[ zip ]
  }

  # Fetch a language for this filetype
  #
  # @param [String] fname The file name to check
  # @example
  #   Filetype.get('foo.rb')   #=> :ruby
  #   Filetype.get('Rakefile') #=> :rake
  # @return [Symbol] The language found or nil
  def get(fname)
    FTYPES.each do |ftype, rule|
      return ftype if file_passes_rule?(fname, rule)
    end
    nil
  end

  # Fetch a list of possible languages which match this filetype
  #
  # @param [String] fname The file name to check
  # @example
  #   Filetype.all('foo.h') #=> [:c, :cpp, :objc]
  # @return [Array] The list of languages found
  def all(fname)
    FTYPES.select do |ftype, rule|
      ftype if file_passes_rule?(fname, rule)
    end.keys
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
  def add(ftype, rule)
    FTYPES[ftype] = rule
  end

  private

  def self.ext(fname)
    ext = File.extname(fname)[1..-1]
    ext.downcase if ext
  end

  def self.file_passes_rule?(fname, rule)
    base_fname = File.basename(fname)
    case rule
    when Array
      return rule.include? ext(base_fname)
    when Regexp
      return base_fname.match rule
    when String, Symbol
      return base_fname == rule.to_s
    end
  end
end
