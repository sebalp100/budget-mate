require 'rails_helper'

RSpec.describe 'New Operation form', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category, user:) }

  before do
    sign_in user
    visit new_operation_path
  end

  context 'with valid information' do
    it 'creates a new operation' do
      fill_in 'Name', with: 'Groceries'
      fill_in '$0.00', with: 50
      select category.name, from: 'Category'
      click_on 'Save'

      expect(page).to have_content('Groceries')
      expect(page).to have_content('$50.00')
      expect(page).to have_content(category.name)
    end
  end

  context 'with invalid information' do
    it 'displays error messages' do
      fill_in 'Name', with: ''
      fill_in '$0.00', with: ''
      click_on 'Save'

      expect(page).to have_selector('h2', text: '2 errors prohibited this operation from being saved:')
      expect(page).to have_selector('li', text: "Name can't be blank")
      expect(page).to have_selector('li', text: "Amount can't be blank")
    end
  end
end
