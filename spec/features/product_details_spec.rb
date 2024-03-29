require 'rails_helper'

RSpec.feature "Navigate to product details from home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
         image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see product details" do
    # ACT
    visit root_path
    click_link('Details')

    # DEBUG
    sleep 1
    save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail'

  end
end