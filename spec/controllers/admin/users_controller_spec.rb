require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user, admin: true) }
  describe '#index' do
    before(:each) do
      sign_in user
      get :index
    end

    it { expect(response).to render_template(:index) }
    it { expect(assigns(:users)).to eq(User.all) }
  end

  describe '#new' do
    before(:each) do
      sign_in user
      get :new
    end

    it { expect(response).to render_template(:new) }
    it { expect(assigns(:user)).to be_kind_of(User) }
  end

  describe '#create' do
    context 'valid user' do
      before(:each) do
        sign_in user
        post :create, user: { email: 'new@user.com', password: '12345678' }
      end

      it { expect(flash[:notice]).to eq(I18n.t('activerecord.attributes.user.created')) }
      it { expect(response).to redirect_to(admin_users_path) }
      it { expect(User.count).to eq(2) }
    end

    context 'invalid user' do
      before(:each) do
        sign_in user
        post :create, user: { email: nil }
      end

      it { expect(response).to render_template(:new) }
    end
  end

  describe '#edit' do
    before(:each) do
      sign_in user
      get :edit, id: user.id
    end

    it { expect(response).to render_template(:edit) }
    it { expect(assigns(:user)).to eq(user) }
  end

  describe '#update' do
    context 'valid' do
      before(:each) do
        sign_in user
        put :update, id: user.id, user: { email: 'new@user.com' }
      end

      it { expect(flash[:notice]).to eq(I18n.t('activerecord.attributes.user.updated')) }
      it { expect(response).to redirect_to(admin_users_path) }
    end

    context 'invalid' do
      before(:each) do
        sign_in user
        put :update, id: user.id, user: { email: nil }
      end

      it { expect(response).to render_template(:edit) }
    end
  end

  describe '#destroy' do
    let(:dead_user) { FactoryGirl.create(:user, email: 'dead@user.com') }
    before(:each) do
      sign_in user
      delete :destroy, id: dead_user.id
    end

    it { expect(response).to redirect_to(admin_users_path) }
    it { expect(assigns(:user)).to eq(dead_user) }
    it { expect(User.count).to eq(1) }
  end
end
