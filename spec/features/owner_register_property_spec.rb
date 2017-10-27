require 'rails_helper'

feature 'owner register a new property' do
  before :each do
    create(:property_type)
    create(:location)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Anunciar uma propriedade'

    fill_in 'Título', with: 'Sitío do picapau amarelo'
    select 'Campinas - São Paulo', from: 'Localização'
    fill_in 'Área (m²)', with: 200
    select 'Sítio', from: 'Tipo de propriedade'
    fill_in 'Quartos', with: 6
    fill_in 'Ocupação maxima', with: 20
    fill_in 'Dias mínimos para alugar', with: 3
    fill_in 'Dias máximos para alugar', with: 15
    fill_in 'Valor padrão para a díaria', with: 200
    fill_in 'Descrição', with: 'Sítio para tirar férias'
    fill_in 'Regras de uso', with: 'Limpar tudo antes de sair'
    click_on 'Criar Propriedade'

    expect(current_path).to eq(property_path(Property.last))
    expect(page).to have_css('h1', text: 'Sitío do picapau amarelo')
    expect(page).to have_css('p.lead', text: 'Sítio para tirar férias')
    expect(page).to have_css('dt', text: 'Localização')
    expect(page).to have_css('dt', text: 'Área')
    expect(page).to have_css('dt', text: 'Tipo de propriedade')
    expect(page).to have_css('dt', text: 'Quartos')
    expect(page).to have_css('dt', text: 'Ocupação maxima')
    expect(page).to have_css('dt', text: 'Dias mínimos para alugar')
    expect(page).to have_css('dt', text: 'Dias máximos para alugar')
    expect(page).to have_css('dt', text: 'Preço da diaria')
    expect(page).to have_css('dt', text: 'Regras de uso')
    expect(page).to have_css('dd', text: 'Campinas - São Paulo')
    expect(page).to have_css('dd', text: '200')
    expect(page).to have_css('dd', text: 'Sítio')
    expect(page).to have_css('dd', text: '6')
    expect(page).to have_css('dd', text: '20')
    expect(page).to have_css('dd', text: '3')
    expect(page).to have_css('dd', text: '15')
    expect(page).to have_css('dd', text: '200')
    expect(page).to have_css('dd', text: 'Limpar tudo antes de sair')
  end

  scenario 'and must fill all fields' do
    visit root_path
    click_on 'Anunciar uma propriedade'

    expect(current_path).to eq(new_property_path)
    fill_in 'Título', with: ''
    select 'Campinas - São Paulo', from: 'Localização'
    fill_in 'Área (m²)', with: 200
    select 'Sítio', from: 'Tipo de propriedade'
    fill_in 'Quartos', with: 6
    fill_in 'Ocupação maxima', with: ''
    fill_in 'Dias mínimos para alugar', with: ''
    fill_in 'Dias máximos para alugar', with: ''
    fill_in 'Valor padrão para a díaria', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Regras de uso', with: ''
    click_on 'Criar Propriedade'

    expect(page).to have_css('div.alert.alert-danger',
                             text: 'não pode ficar em branco')
  end
end
