require 'rails_helper'

RSpec.describe 'Categories index page', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:category1) { FactoryBot.create(:category, name: 'Travel', user:) }
  let!(:category2) { FactoryBot.create(:category, name: 'Food', user:) }

  before do
    sign_in user
    visit categories_path
  end

  it 'displays recipe names and descriptions and remove button actions' do
    expect(page).to have_content(category1.name)
    expect(page).to have_content(category2.name)
    click_on 'Travel', match: :first
    expect(page).to_not have_content(category2.name)
    expect(page).to have_content('Transactions')
  end
end
