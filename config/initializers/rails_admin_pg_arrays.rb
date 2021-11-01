# Parent class, can be extended for other data types
class RailsAdminPgArray < RailsAdmin::Config::Fields::Base
  register_instance_option :formatted_value do
    value.join(',') unless value.blank?
  end
end

# String for text arrays
class RailsAdminPgStringArray < RailsAdminPgArray
  def parse_input(params)
    params[name] = params[name].split(',') if params[name].is_a?(::String)
  end
end

RailsAdmin::Config::Fields::Types.register(:pg_string_array, RailsAdminPgStringArray)
