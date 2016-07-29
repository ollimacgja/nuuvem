require 'rails_helper'

RSpec.describe CatalogController, type: :controller do
  describe '#index' do
    let(:user) { FactoryGirl.create(:user, admin: true) }
    let(:game) { FactoryGirl.create(:game, published: true) }
    let(:category) { FactoryGirl.create(:category) }
    before(:each) do
      game
      category
      sign_in user
      get :index
    end

    it { expect(response).to render_template(:index) }
    it { expect(assigns(:games)).to eq([game]) }
    it { expect(assigns(:categories)).to eq([category]) }
    it { expect(assigns(:filter)).to eq('desc' => '', 'category_id' => '') }
  end
end
