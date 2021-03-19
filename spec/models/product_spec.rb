require 'rails_helper'

RSpec.describe Product, type: :model do

    before(:each) do 
      @u = User.create( email: "artist2@gmail.com" ,password: "123456", encrypted_password: "123456", first_name: "artist2", last_name: "artist2", adress: "5 rue des artist", city: "Paris", phone_number: 0600000001, artist: true)
        @product = Product.create!(
            title: "New title",
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into elec",
            category: "Caramel" ,
            style: "toile sur chassis",
            height: 90,
            width: 90,
            depth: 15,
            weight: 90,
            border_product: false, 
            authenticable_product: false,
            status: "solde",
            price: 800,
            avatar: Rack::Test::UploadedFile.new('app/assets/images/image.jpeg'),
            image_url:  "https://images.unsplash.com/photo-1546930722-a1292ed9dee8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8dGFibGVhdSUyMGFydHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
            admin_id: @u.id
        )
    end

    context "validation" do

        it "is valid with valid attributes" do
          expect(@product).to be_a(Product)
          expect(@product).to be_valid
        end
    end

    describe "#height, #width, title, description and #price" do
        it "should be higher" do
            expect(@product.title.length).to be >= 5
            expect(@product.description.length).to be >= 20
            expect(@product.height).to be >= 70
            expect(@product.width).to be >= 70
            expect(@product.price).to be >= 400
        end
      end

      describe "#avatar" do
        it "returns false if there is an image" do
          image = Product.create(avatar: Rack::Test::UploadedFile.new('app/assets/images/image.jpeg'))
          expect(image).not_to be_valid
          expect(image.errors.include?(:avatar)).to eq(false)    
        end
      end

      describe "#title" do
        it "should not be valid without title" do
          title = Product.create(title: "Jo")
          expect(title).not_to be_valid
          expect(title.errors.include?(:title)).to eq(true)
        end
      end

      describe "#description" do
        it "should not be valid without description" do
          description = Product.create(description: "ook")
          expect(description).not_to be_valid
          expect(description.errors.include?(:description)).to eq(true)
        end
      end




end