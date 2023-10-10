module EmployeesHelper
  def selectedCountry(employee)
    country = employee.address.country if employee.address.present?
    return country
  end

  def selectedState(employee)
    state = employee.address.state if employee.address.present?
    return state
  end

  def selectedCity(employee)
    city = employee.address.city if employee.address.present?
    return city
  end

  def full_location(address)
    country_name = CS.countries[address&.country&.to_sym] || address&.country
    state_name = CS.states(address&.country&.to_sym)&.fetch(address&.state&.to_sym, address&.state) || address&.state
    city_name = CS.cities(address&.state&.to_sym, address&.country&.to_sym).try(:[], address&.city.to_i) || address&.city
    address_line_1 = address&.address_line_1

    location_parts = [
      address_line_1,
      "<strong>#{city_name}</strong>",
      "<strong>#{state_name}</strong>",
      "<strong>#{country_name}</strong>",
    ].compact

    location_string = location_parts.join(", ")
    location_string.html_safe
  end
end
