require 'rails_helper'

feature 'User edit companies' do
  scenario 'successfully' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    visit edit_company_path(company)

    fill_in 'Nome',     with: 'Seara'
    fill_in 'Local',    with: 'Ceará'
    fill_in 'Email',    with: 'contato@seara.com'
    fill_in 'Telefone', with: '123456678'

    click_on 'Atualizar Empresa'

    expect(page).to have_css('h1', text: 'Seara')
    expect(page).to have_content  'Ceará'
    expect(page).to have_content  'contato@seara.com'
    expect(page).to have_content  '123456678'
  end
end
