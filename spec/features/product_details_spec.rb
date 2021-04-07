require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Users can navigate from the home page to the product detail page by clicking on a product image" do
    # ACT
    visit root_path
    first('img').click

    # DEBUG
    # save_and_open_screenshot

    # VERIFY
    expect(page).to have_css "article.product-detail"
    # save_and_open_screenshot
  end

  scenario "Users can navigate from the home page to the product detail page by clicking on a product name" do
    # ACT
    visit root_path
    first('h4').click

    # DEBUG
    # save_and_open_screenshot

    # VERIFY
    expect(page).to have_css "article.product-detail"
    # save_and_open_screenshot
  end

  scenario "Users can navigate from the home page to the product detail page by clicking on a details button" do
    # ACT
    visit root_path
    first('a.btn.btn-default.pull-right').click

    # DEBUG
    # save_and_open_screenshot

    # VERIFY
    expect(page).to have_css "article.product-detail"
    # save_and_open_screenshot
  end
end
