require 'rails_helper'
 
feature 'Admin creates product' do
  given!(:product) { Product.new(title: 'Widget X', description: 'This is a description.', price: 12.99, shipping_price: 2.95) }
 
  scenario 'with valid input' do
    visit admin_products_path
    click_link 'New Product'
    fill_in 'Title', with: product.title
    fill_in 'Description', with: product.description
    fill_in 'Price', with: product.price
    fill_in 'Shipping price', with: product.shipping_price
    click_button 'Create Product'
    expect(page).to have_content 'The product was created successfully'
  end
end