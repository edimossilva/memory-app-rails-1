require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns success status' do
      get '/users'
      expect(response).to be_successful
    end
  end

  describe 'POST /users/new' do
    it 'creates the user' do
      user_attributes = FactoryBot.attributes_for(:user)
      expect { post '/users/new', params: user_attributes }.to change(User, :count).by(+1)
    end

    it 'cant create the user' do
      user_attributes = FactoryBot.attributes_for(:user)

      expect { post '/users/new', params: { name: ''} }.to_not change(User, :count)
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { create(:user) }

  it 'deletes the user' do
    expect { delete("/users/#{user.id}") }.to change(User, :count).from(1).to(0)
  end
  end

  describe 'find params id' do
    let!(:user) { create(:user) }
    it 'where have id' do
      get '/users', params: { id: user.id }
      expect(user).to eq(User.last)
    end
  end

  describe 'PATCH #update' do
    let!(:user) { create(:user) }

    it 'update info user' do
      params = { name: 'Edimo' }
      patch "/users/#{user.id}", params: { id: user.id, name: 'Edimo', phone: '996745953' }
      user.reload
      expect(user.name).to eq(params[:name])
      expect(response).to redirect_to action: 'index'
    end
  end
end
