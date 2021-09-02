class ApplicantService
    class << self
        # function create one applicant
        # @param [<Type>] applicant <description>
        # @return [<Type>] is_save_applicant
        def createApplicant(applicant)
            @is_save_applicant = ApplicantRepository.createApplicant(applicant)
        end
    end
end
