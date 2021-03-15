# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

@toile = "toile sur chassis"
@photo = "photo"
@dessin = "dessin"
@style = [@toile, @photo, @dessin]
@statut = "Available"

20.times do |product|
    Product.create!(
        title: Faker::Books::CultureSeries.culture_ship_class,
        description: Faker::Hipster.paragraph_by_chars,
        category: Faker::Beer.malts ,
        style: @style.sample,
        height: rand(71..150),
        width: rand(71..150),
        depth: rand(5..30),
        weight: rand(50..100),
        border_product: false, 
        authenticable_product: false,
        status: @statut ,
        to_rent: false, 
        to_buy: false,
        price: rand(400..1000)
    )
end