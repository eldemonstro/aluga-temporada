require 'rails_helper'

feature 'User sends proposal to property' do
  before :each do
    @property = create(:property)
  end

  scenario 'sucessfully' do
    visit root_path
    click_on @property.title
    click_on 'Enviar Proposta'

    fill_in 'Nome', with: 'Mario'
    fill_in 'Email', with: 'a@b.com'
    fill_in 'Data de início', with: '12/03/2018'
    fill_in 'Data de fim', with: '16/03/2018'
    fill_in 'Quantidade de pessoas', with: 5
    fill_in 'Propósito da locação', with: 'Férias com a família'
    check 'Aceito as regras'
    click_on 'Enviar Proposta'

    expect(current_path).to eq(proposal_path(Proposal.last))
    expect(page).to have_css('h1', text: "Sua proposta para #{@property.title}")
    expect(page).to have_css('hr')
    expect(page).to have_css('dl')
    expect(page).to have_css('dt', text: 'Data de início')
    expect(page).to have_css('dt', text: 'Data de fim')
    expect(page).to have_css('dt', text: 'Quantidade de pessoas')
    expect(page).to have_css('dt', text: 'Propósito da locação')
    expect(page).to have_css('dt', text: 'Valor total')
    expect(page).to have_css('dd', text: '12/03/2018')
    expect(page).to have_css('dd', text: '16/03/2018')
    expect(page).to have_css('dd', text: '5')
    expect(page).to have_css('dd', text: 'Férias com a família')
    expect(page).to have_css('dd', text: 'R$ 800,00')
  end

  scenario 'and must fill required fields' do
    visit root_path
    click_on @property.title
    click_on 'Enviar Proposta'

    fill_in 'Nome', with: ''
    fill_in 'Email', with: ''
    fill_in 'Data de início', with: ''
    fill_in 'Data de fim', with: ''
    fill_in 'Quantidade de pessoas', with: ''
    fill_in 'Propósito da locação', with: ''
    check 'Aceito as regras'
    click_on 'Enviar Proposta'

    expect(page).to have_css('div.alert.alert-danger',
                             text: 'não pode ficar em branco')
  end
end
