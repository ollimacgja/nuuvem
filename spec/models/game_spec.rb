require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '#set_sku' do
    context 'existing game with sku' do
      before { FactoryGirl.create(:game) }
      let(:new_game) { FactoryGirl.create(:game, name: 'Test') }

      it { expect(new_game.sku).to eq(10_001) }
    end

    context 'not existing game with sku' do
      let(:new_game) { FactoryGirl.create(:game, name: 'Test') }

      it { expect(new_game.sku).to eq(10_000) }
    end
  end
end
