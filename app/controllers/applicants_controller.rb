class ApplicantsController < ApplicationController
  def applicants
    @applicant = Applicant.new
  end

  def confirm 
    @file_path = ""
    @name = ""
    @user_name = ""
    @applicant = Applicant.new(user_params)
    @progLangLev = params[:applicant][:programming]
    if !@applicant.valid?
      if params[:applicant][:profile_photo] && !params[:applicant][:profile_photo].content_type.in?(%w(image/png image/jpg image/jpeg))
        flash[:img_notice] = "you should be choosen img file"
      end
      render :applicants  
    else
      if params[:applicant][:profile_photo] && !params[:applicant][:profile_photo].content_type.in?(%w(image/png image/jpg image/jpeg))
        flash[:img_notice] = "you should be choosen img file"
        render :applicants 
      end
      # create profile image file
      if params[:applicant][:profile_photo]
        @name = params[:applicant][:profile_photo].original_filename
        @user_name = params[:applicant][:name]
        @file_path = @user_name+@name 
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
    @applicant = Applicant.new(article_params)
    @is_save_applicant = ApplicantService.createApplicant(@applicant)
    if @is_save_applicant
      render html: '<h2 style="text-align:center; margin-top:15px;">You Are Successfully! Thank <a href=\'applicants/applicants\' >Back</a></h2>'.html_safe
    else
      render :applicants
    end
  end

  private
    def user_params
      programming = params[:applicant][:programming]
      @result = ""
      programming.each do |a|
        @result = @result.to_s + (a[:language] + " : " + a[:level] + " , ").to_s 
      # puts "#{a[:language]}:#{a[:level]}\n"
      # puts "Level : #{a[:level]}\n"
      end
      @programmingstr= @result.delete_suffix(' , ')
      custom_params = ActionController::Parameters.new({
        applicant_obj: {
          name: params[:applicant][:name],
          profile_photo: @file_path,
          dob: params[:applicant][:dob],
          phone_no1: (params[:applicant][:phone_no1]),
          phone_no2: (params[:applicant][:phone_no2]),
          email: params[:applicant][:email],
          current_address: params[:applicant][:current_address],
          hometown_address: params[:applicant][:hometown_address],
          bachelor_university: params[:applicant][:bachelor_university],
          bachelor_year: params[:applicant][:bachelor_year],
          bachelor_degree: params[:applicant][:bachelor_degree],
          master_university: params[:applicant][:master_university],
          master_year: params[:applicant][:master_year],
          master_degree: params[:applicant][:master_degree],
          diploma_name: params[:applicant][:diploma_name],
          certificate: params[:applicant][:certificate],
          programming:  @programmingstr,
          english: params[:applicant][:english],
          japanese: params[:applicant][:japanese],
          other: params[:applicant][:other],
          internship_info: params[:applicant][:internship_info],
          job_experience: params[:applicant][:job_experience],
          total_exp_year: params[:applicant][:total_exp_year],
        }
      })
      custom_params.require(:applicant_obj).permit(:name, :profile_photo, :dob, :phone_no1, :phone_no2, :email, :current_address, :hometown_address, :bachelor_university, :bachelor_year, :bachelor_degree, :master_university, :master_year, :master_degree, :diploma_name, :certificate, :programming, :english, :japanese, :other, :internship_info, :job_experience, :total_exp_year, :comment, :created_by, :updated_by , :test)
    end

    def article_params
      params.require(:applicant).permit(:name, :profile_photo, :dob, :phone_no1, :phone_no2, :email, :current_address, :hometown_address, :bachelor_university, :bachelor_year, :bachelor_degree, :master_university, :master_year, :master_degree, :diploma_name, :certificate, :programming, :english, :japanese, :other, :internship_info, :job_experience, :total_exp_year, :comment, :created_by, :updated_by)
    end
end
