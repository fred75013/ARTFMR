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

@images = [
  "https://www.tableau-deco.net/wp-content/uploads/2019/10/tableau-deco-joker-street-art-pochoir.jpg",
  "https://cdn.shopify.com/s/files/1/2682/2802/products/tableau-moderne-le-visage-d-une-femme-tableau-moderne-ruedestableaux-com-60x90cm-13749270642731_1200x.jpg?v=1594923800",
  "https://labaleinegraphique.com/wp-content/uploads/2019/05/tableau_tags_graffitis_decoration_street_art_zoom.jpg",
  "https://d2ans0z9s1x1c.cloudfront.net/produits/tableau-pop-art-chien-street-art-5fe23d8d2c177.jpg",
  "https://i.pinimg.com/originals/70/2a/0d/702a0d9a72451d836887f0ea346f70a7.jpg",
  "https://cdn.shopify.com/s/files/1/0315/4362/3817/products/loftdeco-tableau-femme-impressionniste-toile-peinture-decoration-14197858435209_900x.jpg?v=1587805655",
  "https://storage.gra.cloud.ovh.net/v1/AUTH_ca60d77ddd5e42749d7c4c17f753540d/ugm-data/pictures/l-aquarelle-autrement/1877036-tableau-peinture-femme-africaine-1.jpeg?1551180783",
  "https://i1.wp.com/hoteleole.fr/wp-content/uploads/images/nom_de_peintre_celebre_5.jpg?w=1250",
  "https://static.lexpress.fr/medias_9526/w_1000,c_fill,g_north/vincent-van-gogh_4877375.jpg",
  "http://m.oeuvres-art.com/images/le-baiser-thumb.jpg",
  "https://www.cineclubdecaen.com/peinture/peintres/matisse/reve.jpg",
  "https://urdla.com/blog/wp-content/uploads/2019/08/deleglise0710-copie-1.jpg",
  "https://i.pinimg.com/736x/bc/86/13/bc8613529da60205565a5033f13e7458.jpg",
  "https://www.atelier-du-soleil.fr/wp-content/uploads/sites/7524/2020/03/restaurer.jpg",
  "https://shop.amaury-dubois.com/wp-content/uploads/2020/04/blue-abstract-painting-5.jpg",
  "https://www.johnbeckley.com/images/2017/03/Explomium-tableau-abstrait-carre-john-beckley-2017.jpg",
  "https://www.artmajeur.com/medias/standard/n/a/nathalie-robert/artwork/11942429_9d5cee46-0f5d-40dd-b012-b32df1177c9d.jpg?v=1549706793",
  "https://storage.gra.cloud.ovh.net/v1/AUTH_ca60d77ddd5e42749d7c4c17f753540d/ugm-data/pictures/tableaux-abstraits-et-geometriques-par-marie-vinouse/product-5d5ffc320d9e5-1.jpeg?1566571572",
  "https://cdn.shopify.com/s/files/1/0277/5416/8395/products/tableau-abstrait-blanc-noir-et-jaune-toile-royaume-du-tableau.jpg?v=1595666872",
  "https://i.pinimg.com/originals/63/17/b1/6317b186565cd942040e7d621ba201d1.jpg",
  "https://storage.gra.cloud.ovh.net/v1/AUTH_ca60d77ddd5e42749d7c4c17f753540d/ugm-data/pictures/tableaux-abstraits-et-geometriques-par-marie-vinouse/product-5d5d77ea8589e-1_medium.jpeg",
  "https://d2ans0z9s1x1c.cloudfront.net/produits/tableau-abstrait-rose-or-blanc-bleu-5fe23d837bd33.jpg",
  "https://storage.gra.cloud.ovh.net/v1/AUTH_ca60d77ddd5e42749d7c4c17f753540d/ugm-data/pictures/tableaux-abstraits-et-geometriques-par-marie-vinouse/product-5d8b54d03de4a-1_medium.jpeg"

]

@category = [
  "aontemporain",
  "abstrait",
  "street-art",
  "aop-art",
  "réalisme",
  "surrealisme"
]
@u = User.create!(
  email: "coucou@yopmail.com",
  password: "coucou!",
  nickname: "Picalo",
  first_name: "Coucou",
  last_name: "oucouc",
  adress: "12 rue du chacal",
  city: "bordeaux",
  phone_number: 0o771006523,
  artist: true,
)
@u1 = User.create!(
  email: "artist@gmail.com",
  password: "123456",
  nickname: "Picato",
  first_name: "artist",
  last_name: "artist",
  adress: "5 rue des artist",
  city: "paris",
  phone_number: 0o600000001,
  artist: true
)
@u2 = User.create!(
  email: "artist2@gmail.com",
  password: "123456",
  nickname: "Picamo",
  first_name: "artista",
  last_name: "artisto",
  adress: "5 rue des artist",
  city: "lille",
  phone_number: 0o600000001,
  artist: true
)
@u3 = User.create!(
  email: "artist3@gmail.com",
  password: "123456",
  nickname: "Micaflo",
  first_name: "artista",
  last_name: "artisto",
  adress: "5 rue des artist",
  city: "toulouse",
  phone_number: 0o600000001,
  artist: true
)

@artist = [@u.id, @u1.id, @u2.id, @u3.id]
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
    admin_id: @artist.sample
  )
end

@admin = User.create!(
  email: "admin@gmail.com",
  password: "123456",
  nickname: "Micaflo",
  first_name: "artista",
  last_name: "artisto",
  adress: "5 rue des artist",
  city: "Paris",
  phone_number: 0o600000001,
  artist: true,
  admin: true
)
