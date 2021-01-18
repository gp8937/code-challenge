class Company < ApplicationRecord

  has_rich_text :description

  validates_with CompanyEmailValidator

  before_validation :populate_address_fields

  private 

  def populate_address_fields
    return if zip_code.empty? 
    address = ZipCodes.identify(zip_code)
    if address.nil?
      self.city = nil
      self.state = nil
      errors.add :zip_code, "not a valid US zip code"
      return
    end
    self.city = address[:city]
    self.state = address[:state_code]
  end

end
