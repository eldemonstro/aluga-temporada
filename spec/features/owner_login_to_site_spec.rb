require 'rails_helper'

feature 'owner login to site' do
  before :each do
    create(:owner, email: 'a@b.com', password: '123456789')
  end

  scenario 'succesfully' do
    visit root_path
    click_on 'Entrar como proprietário'

    within 'main.container' do
      fill_in :email, with: 'a@b.com'
      fill_in :password, with: '123456789'
      click_on 'Entrar'
    end

    expect(current_path).to eq(root_path)

    within 'main.container' do
      expect(page).to have_css('div.alert.alert-sucess',
                               text: 'Você entrou com sucesso')
      expect(page).not_to have_link('Entrar')
      expect(page).to have_link('Sair')
    end
  end

  scenario 'and fill all fields' do
    visit root_path
    click_on 'Entrar como proprietário'

    within 'main.container' do
      fill_in :email, with: ''
      fill_in :password, with: ''
      click_on 'Entrar'
    end

    expect(current_path).to eq(login_owners_path)

    expect(page).to have_css('div.alert.alert-danger',
                             text: 'Usuario/Senha invalidos')
  end

  scenario 'and owner must exists' do
    visit root_path
    click_on 'Entrar como proprietário'

    within 'main.container' do
      fill_in :email, with: 'a@b.com'
      fill_in :password, with: 'abcdefghi'
      click_on 'Entrar'
    end

    expect(current_path).to eq(login_owners_path)

    expect(page).to have_css('div.alert.alert-danger',
                             text: 'Usuario/Senha invalidos')
  end
end
