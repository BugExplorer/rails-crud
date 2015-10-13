module CustomFields
  extend ActiveSupport::Concern

  module ClassMethods
    def custom_fields(*args)
      args.each do |attr_name|
        define_method(attr_name) do
          custom_field_part(attr_name)
        end

        define_method("#{attr_name}=") do |value|
          custom_field_part(attr_name, value)
        end
      end
    end
  end

  protected

    def custom_field_part(*args)
      key, value = args
      key = key && key.to_s
      if args.size == 1
        parameters && parameters[key]
      elsif args.size == 2
        raise ArgumentError, "invalid key #{key.inspect}" unless key
        parameters_will_change!
        self.parameters = (parameters || {})
        self.parameters[key]
      else
        raise ArgumentError, "wrong number of arguments (#{args.size} for 1 of 2)"
      end
    end
end
