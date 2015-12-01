class RegistrationsController < ApplicationController

  def create
    @user = User.new(email: params[:email],
                     password: params[:password])
    if @user.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by!(email: params[:email])
    if @user && @user.authenticate(params[:password])
      render "login.json.jbuilder", status: :ok
    else
      render json: { error: "Could not find user for #{params[:email]} or wrong password." },
        status: :unauthorized
    end
  end

  def delete
    @user = User.find_by!(email: params[:email])
    if @user && @user.authenticate(params[:password])
       @user.destroy
       render json: {success: "Delete success!"}
    else
      render json: { error: "Invalid email (#{params[:email]}) or password." },
        status: :unauthorized
    end
  end
end
