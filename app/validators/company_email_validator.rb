class CompanyEmailValidator < ActiveModel::Validator
    def validate(record)
        unless record.email.empty? or record.email.ends_with? "@getmainstreet.com"
            record.errors.add :email, "domain is expected to be getmainstreet.com"
        end
    end
end