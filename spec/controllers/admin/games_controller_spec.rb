require 'rails_helper'

RSpec.describe Admin::GamesController, type: :controller do
  let(:user) { FactoryGirl.create(:user, admin: true) }
  let(:game) { FactoryGirl.create(:game) }
  describe '#index' do
    before(:each) do
      game
      sign_in user
      get :index
    end

    it { expect(response).to render_template(:index) }
    it { expect(assigns(:games)).to eq(Game.all) }
  end

  describe '#new' do
    before(:each) do
      sign_in user
      get :new
    end

    it { expect(response).to render_template(:new) }
    it { expect(assigns(:game)).to be_kind_of(Game) }
  end

  describe '#create' do
    context 'valid game' do
      before(:each) do
        game
        sign_in user
        post :create, game: { name: 'blebla', description_en: 'This is english.' }
      end

      it { expect(flash[:notice]).to eq(I18n.t('activerecord.attributes.game.created')) }
      it { expect(response).to redirect_to(admin_games_path) }
      it { expect(Game.count).to eq(2) }
    end

    context 'invalid game' do
      before(:each) do
        sign_in user
        post :create, game: { name: nil }
      end

      it { expect(response).to render_template(:new) }
    end
  end

  describe '#edit' do
    before(:each) do
      game
      sign_in user
      get :edit, id: game.id
    end

    it { expect(response).to render_template(:edit) }
    it { expect(assigns(:game)).to eq(game) }
  end

  describe '#update' do
    context 'valid' do
      before(:each) do
        sign_in user
        put :update, id: game.id, game: { name: 'new name' }
      end

      it { expect(flash[:notice]).to eq(I18n.t('activerecord.attributes.game.updated')) }
      it { expect(response).to redirect_to(admin_games_path) }
    end

    context 'invalid' do
      before(:each) do
        sign_in user
        put :update, id: game.id, game: { name: nil }
      end

      it { expect(response).to render_template(:edit) }
    end
  end

  describe '#destroy' do
    let(:dead_game) { FactoryGirl.create(:game, name: 'dead game', description_en: 'This is english.') }
    before(:each) do
      game
      sign_in user
      delete :destroy, id: dead_game.id
    end

    it { expect(response).to redirect_to(admin_games_path) }
    it { expect(assigns(:game)).to eq(dead_game) }
    it { expect(Game.count).to eq(1) }
  end
end
