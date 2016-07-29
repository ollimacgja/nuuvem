require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do
  let(:user) { FactoryGirl.create(:user, admin: true) }
  let(:category) { FactoryGirl.create(:category) }
  describe '#index' do
    before(:each) do
      category
      sign_in user
      get :index
    end

    it { expect(response).to render_template(:index) }
    it { expect(assigns(:categories)).to eq(Category.all) }
  end

  describe '#new' do
    before(:each) do
      sign_in user
      get :new
    end

    it { expect(response).to render_template(:new) }
    it { expect(assigns(:category)).to be_kind_of(Category) }
  end

  describe '#create' do
    context 'valid category' do
      before(:each) do
        category
        sign_in user
        post :create, category: { name_en: 'blebla' }
      end

      it { expect(flash[:notice]).to eq(I18n.t('activerecord.attributes.category.created')) }
      it { expect(response).to redirect_to(admin_categories_path) }
      it { expect(Category.count).to eq(2) }
    end

    context 'invalid category' do
      before(:each) do
        category
        sign_in user
        post :create, category: { name_en: nil }
      end

      it { expect(response).to render_template(:new) }
    end
  end

  describe '#edit' do
    before(:each) do
      category
      sign_in user
      get :edit, id: category.id
    end

    it { expect(response).to render_template(:edit) }
    it { expect(assigns(:category)).to eq(category) }
  end

  describe '#update' do
    context 'valid' do
      before(:each) do
        sign_in user
        put :update, id: category.id, category: { name_en: 'new name' }
      end

      it { expect(flash[:notice]).to eq(I18n.t('activerecord.attributes.category.updated')) }
      it { expect(response).to redirect_to(admin_categories_path) }
    end

    context 'invalid' do
      before(:each) do
        sign_in user
        put :update, id: category.id, category: { name_en: nil }
      end

      it { expect(response).to render_template(:edit) }
    end
  end

  describe '#destroy' do
    let(:dead_category) { FactoryGirl.create(:category, name_en: 'dead category') }
    before(:each) do
      category
      sign_in user
      delete :destroy, id: dead_category.id
    end

    it { expect(response).to redirect_to(admin_categories_path) }
    it { expect(assigns(:category)).to eq(dead_category) }
    it { expect(Category.count).to eq(1) }
  end
end
