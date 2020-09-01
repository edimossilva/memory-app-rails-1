require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'finds a searched user by name' do
    #prepare
    let!(:user) { create(:user, name: 'Dan') }
    let!(:user1) { create(:user, name: 'Edimo') }
    let!(:user2) { create(:user, name: 'Edmilson') }

    it 'finds by name Ed' do
      #action
      get :index, params: { search: 'Ed' }
      #assert
      assigns(:users).should eq([user1, user2])
    end

    it 'finds by name with da' do
      #action
      get :index, params: { search: 'Da' }
      #assert
      assigns(:users).should eq([user])
    end
  end
end
