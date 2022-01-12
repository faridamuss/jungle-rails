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

scenario " users can navigate from the home page to the product detail page by clicking on a product detail button" do
  # ACT
  visit root_path
  first('article.product').find_link('Details').click

  # DEBUG
  # sleep 5
  # puts page.html
  # save_screenshot

  # VERIFY
  expect(page).to have_css 'article.product-detail', count: 1
  save_screenshot
end

scenario " users can navigate from the home page to the product detail page by clicking on a product box" do
  # ACT
  visit root_path
  first('article.product > header').click

  # DEBUG
  sleep 5
  puts page.html
  save_screenshot

  # VERIFY
  expect(page).to have_css 'article.product-detail', count: 1
  save_screenshot
end


end

# first('button.stripe-button-el').click
# first('article.product').find_link('Add').click

# visit '/cart'