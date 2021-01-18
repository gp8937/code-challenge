require 'memoist'

class Company < ApplicationRecord
  extend Memoist

  has_rich_text :description

  validates_with CompanyEmailValidator

  def address
    unless zip_code.empty? 
      return ZipCodes.identify(zip_code)
    end
  end
  memoize :address

end
