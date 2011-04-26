module Filetype
  FTYPES = {
    :actionscript => %w[ as mxml ],
    :ada          => %w[ ada adb ads ],
    :asm          => %w[ asm s ],
    :batch        => %w[ bat cmd ],
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
    :xml          => %w[ xml xsl dtd xslt ],
  }

  def self.get(fname)
    FTYPES.each do |ftype, rule|
      case rule
      when Array
        ext = File.extname(fname)[1..-1]
        return ftype if rule.include? ext
      when Regexp
        return ftype if fname.match rule
      end
    end
  end
end
