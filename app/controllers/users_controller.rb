class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:activate, :create, :new]
  
  # POST /users
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(:users, notice: 'Registration successfull. Check your email for activation instructions.') }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, notice: 'User was successfully updated.') }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def activate
    if @user = User.load_from_activation_token(params[:id])
      @user.activate!
      redirect_to(login_path, notice: 'User was successfully activated.')
    else
      not_authenticated
    end
  end

end
