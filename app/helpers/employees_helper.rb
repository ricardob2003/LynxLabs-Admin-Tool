module EmployeesHelper
  def full_location(address)
    country_name = CS.countries[address&.country&.to_sym] || address&.country
    state_name = CS.states(address&.country&.to_sym)&.fetch(address&.state&.to_sym, address&.state) || address&.state
    city_name = CS.cities(address&.state&.to_sym, address&.country&.to_sym).try(:[], address&.city.to_i) || address&.city

    "#{city_name}, #{state_name}, #{country_name}"
  end
end
