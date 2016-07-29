require 'rails_helper'

RSpec.describe Admin::HomeController, type: :controller do
  describe '.validate_admin' do
    before { get :index }
    let(:current_user) { FactoryGirl.create(:user) }
    it { expect(self).to redirect_to(root_url) }
  end

  describe '#index' do
    let(:user) { FactoryGirl.create(:user, admin: true) }
    before(:each) do
      FactoryGirl.create(:user, email: 'a?@b.com')
      sign_in user
      get :index
    end

    it { expect(assigns(:users_count)).to eql(User.count) }
    it { expect(response).to render_template(:index) }
  end
end
