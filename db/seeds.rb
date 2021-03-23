# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Product.destroy_all
User.destroy_all

@toile = "toile sur chassis"
@photo = "photo"
@dessin = "dessin"
@style = [@toile, @photo, @dessin]
@statut = "available"

@u = User.create( email: "artist@gmail.com", password: "123456", encrypted_password: "123456", nickname: "Picato", first_name: "artist", last_name: "artist", adress: "5 rue des artist", city: "Paris", phone_number: 0o600000001, artist: true)

@images = [
  "https://images.unsplash.com/photo-1543857778-c4a1a3e0b2eb?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8dGFibGVhdSUyMHN0cmVldCUyMGFydHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1544273677-c433136021d4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8dGFibGVhdSUyMHN0cmVldCUyMGFydHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1546930722-a1292ed9dee8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8dGFibGVhdSUyMGFydHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://labaleinegraphique.com/wp-content/uploads/2019/05/tableau_tags_graffitis_decoration_street_art_zoom.jpg",
  "https://d2ans0z9s1x1c.cloudfront.net/produits/tableau-pop-art-chien-street-art-5fe23d8d2c177.jpg",
  "https://i.pinimg.com/originals/70/2a/0d/702a0d9a72451d836887f0ea346f70a7.jpg",
  "https://cdn.shopify.com/s/files/1/0315/4362/3817/products/loftdeco-tableau-femme-impressionniste-toile-peinture-decoration-14197858435209_900x.jpg?v=1587805655",
  "https://i.ebayimg.com/images/g/eIEAAOSwnSJd3VQ5/s-l300.jpg",
  "https://storage.gra.cloud.ovh.net/v1/AUTH_ca60d77ddd5e42749d7c4c17f753540d/ugm-data/pictures/l-aquarelle-autrement/1877036-tableau-peinture-femme-africaine-1.jpeg?1551180783",
  "https://i1.wp.com/hoteleole.fr/wp-content/uploads/images/nom_de_peintre_celebre_5.jpg?w=1250",
  "https://static.lexpress.fr/medias_9526/w_1000,c_fill,g_north/vincent-van-gogh_4877375.jpg",
  "http://m.oeuvres-art.com/images/le-baiser-thumb.jpg",
  "https://www.cineclubdecaen.com/peinture/peintres/matisse/reve.jpg",
  "https://edu1d.ac-toulouse.fr/blogs31/cm2-hugon-muret/files/2020/04/La-laiti%C3%A8re-253x300.jpg"
]

@category = [
  "Contemporain",
  "Abstrait",
  "Street-art",
  "Pop-art",
  "Réalisme",
  "Surrealisme"
]
@admin = User.create!(
  email: "coucou@yopmail.com",
  password: "coucou!",
  nickname: "Picalo",
  first_name: "Coucou",
  last_name: "oucouc",
  adress: "12 rue du chacal",
  city: "Fronce",
  phone_number: "0771006523",
  artist: true,
)
20.times do |_product|
  Product.create!(
    title: Faker::Books::CultureSeries.culture_ship_class,
    description: Faker::Lorem.paragraph(sentence_count: 4),
    category: @category.sample,
    style: @style.sample,
    height: rand(71..150),
    width: rand(71..150),
    depth: rand(5..30),
    weight: rand(50..100),
    border_product: false,
    authenticable_product: false,
    status: @statut,
    price: rand(400..1000),
    image_url: @images.sample,
    admin_id: rand(@u.id..@admin.id)
  )
end
