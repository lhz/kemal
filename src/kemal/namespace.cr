module Kemal
  class Namespace
    INSTANCE = new

    def initialize
      @namespace = ""
    end

    def namespaced_path(path)
      "#{@namespace}#{path}"
    end

    def with_namespace(path, &block)
      old_namespace = @namespace
      @namespace = namespaced_path(path)
      value = yield
      @namespace = old_namespace
      value
    end
  end
end
