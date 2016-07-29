require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe '#change_locale' do
    context 'valid locale' do
      before(:each) do
        get :change_locale, locale: 'en'
      end
      it { expect(response).to redirect_to(root_url) }
      it { expect(response.cookies['locale']).to eq('en') }
    end

    context 'invalid locale' do
      before(:each) do
        get :change_locale, locale: 'es'
      end
      it { expect(response).to redirect_to(root_url) }
      it { expect(response.cookies['locale']).to eq('en') }
    end
  end

  describe '#set_locale' do
    before(:each) do
      cookies['locale'] = 'en'
      get :change_locale, locale: 'pt-BR'
    end
    it { expect(response).to redirect_to(root_url) }
    it { expect(response.cookies['locale']).to eq('pt-BR') }
  end
end
