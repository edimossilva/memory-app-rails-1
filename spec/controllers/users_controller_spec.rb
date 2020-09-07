require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  context 'GET #new' do
    it 'should success' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'finds a searched user by name' do
    #prepare
    let!(:user) { create(:user, name: 'Daniel') }
    let!(:user1) { create(:user, name: 'Edimo') }
    let!(:user2) { create(:user, name: 'Edmilson') }

    it 'finds by name Ed' do
      #action
      get :index, params: { search_by_name: 'Ed' }
      #assert
      assigns(:users).should eq([user1, user2])
    end

    it 'finds by name with da' do
      #action
      get :index, params: { search_by_name: 'Da' }
      #assert
      assigns(:users).should eq([user])
    end

    it 'finds by name with iel' do
      #action
      get :index, params: { search_by_name: 'iel' }
      #assert
      assigns(:users).should eq([user])
    end

    it 'when does not find any user' do
      #action
      get :index, params: { search_by_name: 'f' }
      #assert
      expect(nil).to be_nil
    end

    it 'when search is empty' do
      #action
      get :index, params: { search_by_name: ' ' }
      #assert
      expect(assigns(:users)).to be_empty
    end
  end
end
