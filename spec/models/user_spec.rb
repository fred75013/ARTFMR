require 'rails_helper'

RSpec.describe User, type: :model do

    before(:each) do 
        @user = User.create!(
            email: "abc@gmail.com",
            password: "My_password"
        )
    end

    describe "validation" do
        it "is valid with valid attributes" do
          expect(@user).to be_a(User)
          expect(@user).to be_valid
        end
    end

    describe "#password" do
        it "should not be lower that 6 characters" do
          invalid_password = User.create(password: "12345")
          expect(invalid_password).not_to be_valid
          expect(invalid_password.errors.include?(:password)).to eq(true)
        end
      end
      
      describe "#email" do
        it "must contain an @" do
          invalid_email = User.create(email: "ab.com")
          expect(invalid_email).not_to be_valid
          expect(invalid_email.errors.include?(:email)).to eq(true)
          
        end
      end

      describe "#email" do
        it "must contain an @ '.fr' '.com'" do
            invalid_email = User.create(email: "abcom@fes")
            expect(invalid_email).not_to be_valid
            expect(invalid_email.errors.include?(:email)).to eq(true)
        end
      end

end

