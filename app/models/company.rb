class Company < ApplicationRecord

  has_rich_text :description

  validates_with CompanyEmailValidator

  before_save :populate_address_fields

  private 

  def populate_address_fields
    return if zip_code.empty? 
    address = ZipCodes.identify(zip_code)
    return if address.nil?
    self.city = address[:city]
    self.state = address[:state_code]
  end

end
