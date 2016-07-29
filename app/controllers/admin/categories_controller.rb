class Admin::CategoriesController < Admin::HomeController
  before_action :find_category, only: [:edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: I18n.t('activerecord.attributes.category.created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to admin_categories_path, notice: I18n.t('activerecord.attributes.category.updated')
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = I18n.t('activerecord.attributes.category.destroyed')
    end
    redirect_to admin_categories_path
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(*Category.globalize_attribute_names)
  end
end
