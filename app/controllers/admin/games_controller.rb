class Admin::GamesController < Admin::HomeController
  before_action :find_game, only: [:edit, :update, :destroy]
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to admin_games_path, notice: I18n.t('activerecord.attributes.game.created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @game.update_attributes(game_params)
      redirect_to admin_games_path, notice: I18n.t('activerecord.attributes.game.updated')
    else
      render :edit
    end
  end

  def destroy
    if @game.destroy
      flash[:notice] = I18n.t('activerecord.attributes.game.destroyed')
    end
    redirect_to admin_games_path
  end

  private

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    permitted = Game.globalize_attribute_names + [:name, :boxshot, :category_id, :published]
    params.require(:game).permit(*permitted)
  end
end