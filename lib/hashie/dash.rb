module Hashie
  class Dash
    class << self
      attr_accessor :required, :hash

      def property(name, args = {})
        @required ||= []
        @hash ||= {}

        define_method(name) do
          @hash[name.to_sym]
        end
        define_method(name.to_s + '=') do |val|
          @hash[name.to_sym] = val
        end
        @required << name if args[:required]
      end
    end

    def initialize(args = {})
      @hash = self.class.hash
      @required = self.class.required
      args.each_pair { |key, val| @hash[key.to_sym] = val }
      @required.each do |key|
        fail ArgumentError unless @hash[key]
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
