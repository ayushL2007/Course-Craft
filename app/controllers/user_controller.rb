class UserController < ApplicationController
  before_action :authenticate, only: [ :edit, :update, :destroy]
  before_action :unless_authenticated, only: [ :new, :create, :login, :login_confirm]

    def show
      @username = (session[:username].nil?) ? params[:username] : session[:username]
      @user = User.find_by(username: @username)
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(allowed_params)
      if @user.save
        redirect_to user_path(@user, username: @user.username)
      else
        flash.now[:alert] = "Sign Up Failed! Invalid credentials"
        redirect_to new_user_path
      end
    end


    def edit
      @user = User.find_by(username: session[:username])
    end

    def update
      if User.update(allowed_params)
        redirect_to user_path(1)
      else
        flash[:alert] = "Profile update failed due to some reason"
        redirect_to edit_user_path
      end
    end

    def destroy
      @user = User.find_by(username: session[:username])
      if @user.delete
        redirect_to root_path
      else
        flash[:alert] = "Account Deletion Failed"
        redirect_to edit_user_path
      end
    end

    def login
    end

    def login_confirm
      @user = User.find_by(username: params[:username])
      if @user.present?
        if @user.authenticate(params[:password])
          store_session({ username: params[:username] })
          redirect_to params[:after] || user_path(@user, username: @user.username)
        else
          flash[:alert] = "Wrong Password"
          redirect_to login_path
        end

      else
        flash[:alert] = "No such Username exist"
        redirect_to login_path
      end
    end

    def logout
      session[:username] = ""
      redirect_to root_path
    end

    #--------------------------------------------------
    private
    def allowed_params
      params
      .require(:user)
      .permit(:username, :email, :full_name, :password, :confirm_password)
      .compact()
    end

    private
    def store_session(session_data)
      session_data.each do |key, value|
        session[key] = value
      end
    end

    private
    def authenticate
      unless User.find_by(username: session[:username]).present?
        redirect_to login_path
      end
    end

    private
    def unless_authenticated
      if User.find_by(username: session[:username]).present?
        redirect_to user_path(1)
      end
    end

end
