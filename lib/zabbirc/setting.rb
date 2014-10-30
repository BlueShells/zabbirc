module Zabbirc
  class Setting
    DEFAULTS = {
        notify: true,
        primary_channel: nil,
        events_priority: :information
    }

    def initialize
      @options = ActiveSupport::HashWithIndifferentAccess.new DEFAULTS.deep_dup
    end

    def set name, value
      @options[name] = value
    end

    def get name
      @options[name]
    end

    def fetch name, value
      @options[name] ||= value
    end

    def to_s
      ret = []
      @options.collect do |k, v|
        ret << "#{k}: #{v}"
      end
      ret.join(", ")
    end
  end
end