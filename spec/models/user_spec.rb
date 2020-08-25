require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(:user) }

  describe 'not empty' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:phone) }
  end

  describe 'field format characters only' do
    it { is_expected.to_not allow_value('/\A[a-zA-Z]+\z/').for(:name).on(:create) }
  end

  describe 'only numericality' do
    it { is_expected.to validate_numericality_of(:phone).on(:create) }
  end
end
