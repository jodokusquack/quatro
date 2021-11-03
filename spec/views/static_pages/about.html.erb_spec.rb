require 'rails_helper'

RSpec.describe 'static_pages/about' do
  it 'has the correct title' do
    render template: 'static_pages/about', layout: 'layouts/application'

    within('title') do
    end
    expect(rendered).to have_content('About | Quarto')
  end
end
