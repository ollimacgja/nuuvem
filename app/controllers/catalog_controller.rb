class CatalogController < ApplicationController
  before_action :set_filter
  def index
    @games = Game.published.with_category(filters_params[:category_id]).with_description_or_name(filters_params[:desc]).uniq
    @filter = filters_params
    @categories = Category.all
  end

  def filters_params
    params.require(:filters).permit(:desc, :category_id)
  end

  def set_filter
    params[:filters] = { desc: '', category_id: '' } if params[:filters].nil?
  end

end
