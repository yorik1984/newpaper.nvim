# encoding: utf-8
# Lorem ipsum code for examlpe highlighting

require File.expand_path('boot', __dir__)

require 'rails/all'

if defined?(Bundler)
   Bundler.require(*Rails.groups(assets: %w[development test]))
end

require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

syntax = Textpow.syntax('ruby')
processor = HTMLProcessor.new
syntax.parse(text, processor)

module HTMLProcessor

  class << self                      # rubyEigenClassOperator
    puts self
  end

  class HTMLProcessor < XMLProcessor # rubySuperClassOperator

    attr_accessor :line, :offset, :text

    def self.test_hightlight(option1, option2)
      # -- init.lua
      # vim.g.ruby_no_identifiers = 1 -- disable highlighting
      @rubyInstanceVariable
      @@rubyClassVariable
      $rubyGlobalVariable
      ENV                      # rubyPredefinedConstant
      $LOAD_PATH               # rubyPredefinedVariable

      # -- init.lua
      # vim.g.ruby_pseudo_operators = 1 -- enable highlighting
      aaa.bbb                # rubyDotOperator
      aaa::bbb               # rubyScopeOperator
      aaa -> bbb             # rubyLambdaOperator
      **aaa                  # rubyDoubleSplatOperator
      *bbb                   # rubySplatOperator
      &aaa                   # rubyProcOperator
                             # < rubySuperClassOperator
                             # << rubyEigenClassOperator
      # -- init.lua
      # vim.g.ruby_operators = 1 -- enable highlighting
      defined?                           # rubyDefinedOperator

    if a and b or c not 5     # rubyEnglishBooleanOperator
    end

      ? :                                # rubyTernaryOperator
      + - * a/b % **                     # rubyArithmeticOperator
      > < >= <= <=>                      # rubyComparisonOperator
      & | ^ ~ << >>                      # rubyBitwiseOperator
      ! && ||                            # rubyBooleanOperator
      ... ..                             # rubyRangeOperator
      -= =  &&= &= ||= |=  += >>= <<= ^= # rubyAssignmentOperator
      a **= b a *= b a %= b
      === == != !~ =~                    # rubyEqualityOperator

      string        = "text with escape \n and #{interpolation} text"
      regex_special = /[#{special.gsub(/./) { |char| "\\#{char}" }}]/
      regex_latin   = /\p{Latin}/
      integer       = 1234567890
      float         = 3.1415926
      boolean_true  = true
      boolean_false = false

      begin
        raise 'This exception will be rescued!'
      rescue StandardError => e
        puts "Rescued: #{e.inspect}"
      end

    end

    protected

    def end_parsing(scope_name)
      @text.each_with_index do |line, index|
        @text[index] = "<span class='l l-#{index + 1}
          #{scope_name.gsub('.', ' ')}'>#{line}</span>"
      end
      puts @text.join('')
    end

  end

end
