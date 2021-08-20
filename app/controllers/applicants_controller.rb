class ApplicantsController < ApplicationController
  def applicants
    @applicant = Applicant.new
  end
  def confirm 
    @applicant = Applicant.new(user_params)
    #  Rails.logger.debug "hello what the hell"
    # render plain: params[:applicant][:programming]
    if !@applicant.valid?
      render :applicants
    else
      render :confirm
    end
  end

  private
    def user_params
      profile_photo = "ajd.jpg"
      programming = params[:applicant][:programming]
      programming.each do |a|
        @dd = @dd.to_s + (a[:language] + " : " + a[:level] + " , ").to_s 
       # puts "#{a[:language]}:#{a[:level]}\n"
       # puts "Level : #{a[:level]}\n"
      end
      @ee= @dd.delete_suffix(' , ')
      # render plain: @ee
      custom_params = ActionController::Parameters.new({
        applicant_obj: {
          name: params[:applicant][:name],
          profile_photo: params[:applicant][:profile_photo],
          dob: params[:applicant][:dob],
          phone_no1: params[:applicant][:phone_no1],
          phone_no2: params[:applicant][:phone_no2],
          email: params[:applicant][:email],
          current_address: params[:applicant][:currentAddress],
          hometown_address: params[:applicant][:hometownAddress],
          bachelor_university: params[:applicant][:b_university],
          bachelor_year: params[:applicant][:b_year],
          bachelor_degree: params[:applicant][:b_degree],
          master_university: params[:applicant][:m_university],
          master_year: params[:applicant][:m_year],
          master_degree: params[:applicant][:m_degree],
          diploma_name: params[:applicant][:diplomaName],
          certificate: params[:applicant][:otherCerti],
          programming:  @ee,
          english: params[:applicant][:english],
          japanese: params[:applicant][:japan],
          other: params[:applicant][:other],
          # hasjobexp: params[:applicant][:hasjobexp],
          internship_info: params[:applicant][:intern_info],
          job_experience: params[:applicant][:job_exp],
          total_exp_year: params[:applicant][:total_exp_year],
          comment: params[:applicant][:comment],
        }
      })
      custom_params.require(:applicant_obj).permit(:name, :profile_photo, :dob, :phone_no1, :phone_no2, :email, :current_address, :hometown_address, :bachelor_university, :bachelor_year, :bachelor_degree, :master_university, :master_year, :master_degree, :diploma_name, :certificate, :programming, :english, :japanese, :other, :internship_info, :job_experience, :total_exp_year, :comment, :created_by, :updated_by)
    end
end
