# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Product.destroy_all

@toile = "toile sur chassis"
@photo = "photo"
@dessin = "dessin"
@style = [@toile, @photo, @dessin]
@statut = "Available"


@images = [
    "https://images.unsplash.com/photo-1543857778-c4a1a3e0b2eb?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8dGFibGVhdSUyMHN0cmVldCUyMGFydHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1544273677-c433136021d4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8dGFibGVhdSUyMHN0cmVldCUyMGFydHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1546930722-a1292ed9dee8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8dGFibGVhdSUyMGFydHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    
]
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
        price: rand(400..1000),
        image_url: @images.sample
    )
end