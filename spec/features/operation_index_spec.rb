require 'rails_helper'

RSpec.describe 'Operations index page', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:category2) { FactoryBot.create(:category, icon: '💳', name: 'Food', user:) }
  let!(:operation1) { FactoryBot.create(:operation, name: 'Cake', author: user, category: category2) }
  let!(:operation2) { FactoryBot.create(:operation, name: 'Drink', author: user, category: category2) }

  before do
    sign_in user
    visit category_operations_path(category2)
  end

  it 'displays operations for a category' do
    expect(page).to have_selector('p', text: operation1.name)
    expect(page).to have_selector('p', text: operation2.name)
    expect(page).to have_selector('span', text: '$19.98')
    expect(page).to have_selector('h1', text: 'Most recent')

    click_on 'New Transaction', match: :first
    expect(page).to_not have_content(operation1.name)
    expect(page).to have_selector('input')
  end
end
