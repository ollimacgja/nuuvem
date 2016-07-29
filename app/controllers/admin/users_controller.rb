class Admin::UsersController < Admin::HomeController
  before_action :find_user, only: [:edit, :update, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: I18n.t('activerecord.attributes.user.created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: I18n.t('activerecord.attributes.user.updated')
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = I18n.t('activerecord.attributes.user.destroyed')
    end
    redirect_to admin_users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end
end
