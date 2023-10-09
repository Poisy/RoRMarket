# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

(1..3).each { |b|
  brand = Brand.new(
    name: "brand-#{b}",
    description: "description-#{b}",
    active: b%2==0,
    redemption: b%2==0 ? "online" : "instore")
  brand.save

  (1..3).each { |p|
    product = Product.new(
      brand_id: brand.id,
      name: "product-#{b}-#{p}",
      amount: rand(1.0..10000.0).round(2),
      currency: "USD",
      active: p%2==1)
    product.save

    (1..3).each { |c|
      card = Card.new(
        product_id: product.id,
        status: c%2==0 ? "available" : "issued",
        currency: "USD",
        amount: product.amount)
      card.save
    }
  }
}