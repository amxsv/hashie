module Hashie
  class Dash
    def initialize(args = {})
      @hash = {}
      @required = []
      args.each_pair { |key, val| @hash[key.to_sym] = val }
      @required.each do |key|
        fail ArgumentError unless @hash[key]
      end
    end

    def self.property(name, args = {})
      define_method(name) do
        @hash[name.to_sym]
      end
      define_method(name.to_s + '=') do |val|
        @hash[name.to_sym] = val
      end
    end

    def [](key)
      @hash[key]
    end

    def []=(key, val)
      @hash[key] = val
    end
  end
end
