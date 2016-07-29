require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#login_helper' do
    context 'logged in user' do
      let(:current_user) { FactoryGirl.create(:user) }

      it { expect(login_helper).to eq('Logged as:  a@a.com <a data-method="delete" href="/users/sign_out" rel="nofollow">Logout</a>') }
    end

    context 'no logged in user' do
      let(:current_user) { nil }

      it { expect(login_helper).to eq('<a href="/users/sign_in">Login</a>') }
    end
  end

  describe '#boolean_helper' do
    context 'true' do
      it { expect(boolean_helper(true)).to eq('<i class="fa fa-check-circle green"></i>') }
    end

    context 'false' do
      it { expect(boolean_helper(false)).to eq('<i class="fa fa-times-circle red"></i>') }
    end
  end
end
