module Hashie
  class Mash
    def initialize
      @hash = {}
    end

    def method_missing(name, *args)
      key = name[0..-2].to_sym
      case name[-1]
      when '='
        @hash[key] = args[0]
      when '?'
        !@hash[key].nil?
      when '!'
        @hash[key] = Mash.new
      when '_'
        self.class.new
      else
        @hash[name]
      end
    end
  end
end
