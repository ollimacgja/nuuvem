class Admin::HomeController < ApplicationController
  layout 'admin'
  before_action :validate_admin
  def index
    @category_count = Category.count
    @users_count = User.count
    @games_count = Game.count
  end

  def validate_admin
    unless current_user && current_user.admin?
      redirect_to root_path, alert: I18n.t('admin.not_allowed')
    end
  end
end
