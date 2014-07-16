module Hashie
  class Dash
    class << self
      attr_accessor :required, :hash, :defaults

      def property(name, args = {})
        @required ||= []
        @hash ||= {}
        @defaults ||= {}

        define_method(name) do
          @hash[name.to_sym]
        end
        define_method(name.to_s + '=') do |val|
          @hash[name.to_sym] = val
        end
        @required << name if args[:required]
        @defaults[name] = args[:default] if args[:default]
      end
    end

    def initialize(args = {})
      @hash = self.class.hash
      @required = self.class.required
      @defaults = self.class.defaults
      args.each_pair { |key, val| @hash[key.to_sym] = val }
      @required.each do |key|
        fail ArgumentError unless @hash[key]
      end
      @defaults.each_key do |key|
        @hash[key] ||= @defaults[key]
      end
    end

    def [](key)
      @hash[key]
    end

    def []=(key, val)
      @hash[key] = val
    end

    def update_attributes!(new_attrs)
      new_attrs.each_key do |key|
        @hash[key] = new_attrs[key] || @defaults[key] if @hash.key?(key)
      end
    end
  end
end
