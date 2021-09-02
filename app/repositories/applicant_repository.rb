require 'logger'
class ApplicantRepository
    class << self
        # function createApplicant
        # @param [<Type>] applicant <description>
        # @return [<Type>] <is_save_applicant>
        def createApplicant(applicant)
            @is_save_applicant = applicant.save
        end

    end

end