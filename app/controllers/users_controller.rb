# coding: utf-8
class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.paginate :page => params[:page], :per_page => 30

  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
#    @user.email = params[:user][:email]
#    @user.login = params[:user][:login]
#    @user.state = params[:user][:state]
#    @user.verified = params[:user][:verified]

    if @user.save
      redirect_to(users_path, :notice => '用户已经成功创建.')
    else
      render :action => "new"
    end
  end

  def update
    @user = User.find(params[:id])
    
    
    if @user.update_by_admin(params[:user])
      redirect_to(users_path, :notice => '用户信息已经更新.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.update_attributes(:disabled=>true)
      redirect_to(users_path, :notice => '用户账号已经禁用.')
    else
      redirect_to :action => "index"
    end
    # @user.soft_delete

    # redirect_to(cpanel_users_url)
  end
end
