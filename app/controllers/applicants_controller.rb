class ApplicantsController < ApplicationController
  def applicants
    @applicant = Applicant.new
    
  end
  def confirm 
    @file_path = ""
    @name = ""
    @user_name = ""
    if params[:applicant][:profile_photo]
      @name = params[:applicant][:profile_photo].original_filename
      @user_name = params[:applicant][:name]

      @file_path = @user_name+@name
    end
    @applicant = Applicant.new(user_params)
    if !@applicant.valid?
      if params[:applicant][:hasjobexp] == "1"
        @hasjobexp= 1
        render :applicants
      else
        @hasjobexp = 0
        render plain: "error"
      end
      
    else
      # create profile image file
      if params[:applicant][:profile_photo]
        path = File.join("app", "assets" , "images", @user_name+@name)
        File.open(path, "wb") { |f| f.write(params[:applicant][:profile_photo].read) }
      end
      render :confirmData
    end
  end
  
  def confirmData
    if !defined?(@applicant)
      redirect_to root_path
    end
  end

  def saveData
    @applicantSave = Applicant.new(article_params)
    if @applicantSave.save
      render html: '<h2 style="text-align:center; margin-top:15px;">You Are Successfully! Thank U</h2>'.html_safe
    else
      render :applicants
    end
    #render plain: params[:applicant]
    # render html: '<h2 style="text-align:center; margin-top:15px;">You Are Successfully! Thank U</h2>'.html_safe
  end
  private
    def user_params
      programming = params[:applicant][:programming]
      programming.each do |a|
        @dd = @dd.to_s + (a[:language] + " : " + a[:level] + " , ").to_s 
       # puts "#{a[:language]}:#{a[:level]}\n"
       # puts "Level : #{a[:level]}\n"
      end
      @programmingstr= @dd.delete_suffix(' , ')
      custom_params = ActionController::Parameters.new({
        applicant_obj: {
          name: params[:applicant][:name],
          profile_photo: @file_path,
          dob: params[:applicant][:dob],
          phone_no1: (params[:applicant][:phone_no1]).to_i,
          phone_no2: (params[:applicant][:phone_no2]),
          email: params[:applicant][:email],
          current_address: params[:applicant][:current_address],
          hometown_address: params[:applicant][:hometown_address],
          bachelor_university: params[:applicant][:b_university],
          bachelor_year: params[:applicant][:b_year],
          bachelor_degree: params[:applicant][:b_degree],
          master_university: params[:applicant][:m_university],
          master_year: params[:applicant][:m_year],
          master_degree: params[:applicant][:m_degree],
          diploma_name: params[:applicant][:diplomaName],
          certificate: params[:applicant][:otherCerti],
          programming:  @programmingstr,
          english: params[:applicant][:english],
          japanese: params[:applicant][:japan],
          other: params[:applicant][:other],
          # hasjobexp: params[:applicant][:hasjobexp],
          internship_info: params[:applicant][:intern_info],
          job_experience: params[:applicant][:job_exp],
          total_exp_year: params[:applicant][:total_exp_year],
        }
      })
      custom_params.require(:applicant_obj).permit(:name, :profile_photo, :dob, :phone_no1, :phone_no2, :email, :current_address, :hometown_address, :bachelor_university, :bachelor_year, :bachelor_degree, :master_university, :master_year, :master_degree, :diploma_name, :certificate, :programming, :english, :japanese, :other, :internship_info, :job_experience, :total_exp_year, :comment, :created_by, :updated_by)
    end

    private
    def article_params
      params.require(:applicant).permit(:name, :profile_photo, :dob, :phone_no1, :phone_no2, :email, :current_address, :hometown_address, :bachelor_university, :bachelor_year, :bachelor_degree, :master_university, :master_year, :master_degree, :diploma_name, :certificate, :programming, :english, :japanese, :other, :internship_info, :job_experience, :total_exp_year, :comment, :created_by, :updated_by)
    end
end
