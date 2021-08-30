class TestController < ApplicationController
  def test
    @user = User.new
  end

  def check
    # render plain: params[:user][:email];
  
    # render plain: @test_var
    # @test_var.each do |a|+
    #   @result+=a
    # end
    # render plain: @result
    # @email = params 
   
    # render plain: test_obj
   
    if params[:user][:file_upload]
      @name = params[:user][:file_upload].original_filename
      @user_name = params[:user][:name]

      @file_path = @user_name+@name
    end
    @user = User.new(user_params)
    if !@user.valid?
      render plain: (16.years.ago.strftime('%Y-%m-%d')).to_i
    end
    # render "test/test"
    # render action: "test"
    # redirect_to test_path
  end

  def confirm 
    @user = params
    # if @user.save
    #   render plain: "Successful...."
    # else
    #   render "test/test"
    # end
  end

  private
    def user_params
      @email = params[:user][:email]
      @name = params[:user][:name]
    
      hoho = ActionController::Parameters.new({
        test_obj: {
          name: @name,
          email: @email,
          file_upload: @file_path
        }
      })
      # render plain: hoho
      hoho.require(:test_obj).permit(:name, :email, :file_upload)
    end
end
