class TestController < ApplicationController
  def test
    @user = User.new
  end

  def check
    # render plain: params[:user][:email];
  
    # render plain: @test_var
    # @test_var.each do |a|
    #   @result+=a
    # end
    # render plain: @result
    # @email = params 
   
    # render plain: test_obj
    @user = User.new(user_params)
    if !@user.valid?
      render "test/test"
    end
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
  # Never trust parameters from the scary internet, only allow the white list through.
   
    def user_params
      @email = params[:user][:email].to_s
      @name = params[:user][:name]
    
      hoho = ActionController::Parameters.new({
        test_obj: {
          name: @name,
          email: @email
        }
      })
      # render plain: hoho
      hoho.require(:test_obj).permit(:name, :email)
    end
end
