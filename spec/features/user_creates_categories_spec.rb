require 'rails_helper'

feature 'User create category' do
  scenario 'successfully' do
    category = Category.new(name:'Designer')

    visit new_category_path

    fill_in 'Nome', with: category.name
    click_on 'Criar Categoria'

    expect(page).to have_css('h1', text: category.name)

  end

  scenario 'and should fill all fields' do
    visit new_category_path

    click_on 'Criar Categoria'

    expect(page).to have_content 'Não foi possível criar a categoria'
  end

  scenario 'and should be unique' do
    category = Category.create(name: 'Designer')
    other_category = Category.new(name: 'Designer')

    visit new_category_path
    fill_in 'Nome', with: other_category.name
    click_on 'Criar Categoria'

    expect(page).to have_content 'Categoria já existente'


  end
end
