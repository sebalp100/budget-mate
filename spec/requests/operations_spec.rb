require 'rails_helper'

RSpec.describe 'Operations', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let!(:category2) { FactoryBot.create(:category, icon: '💳', name: 'Food', user:) }
  let!(:operation1) { FactoryBot.create(:operation, name: 'Cake', author: user, category: category2) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get category_operations_path(category2)
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get new_operation_path
      expect(response).to be_successful
    end
  end
end
