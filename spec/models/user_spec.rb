# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  first_name      :string           not null
#  last_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null


require 'rails_helper'

RSpec.describe User, type: :model do 
    subject { User.create!(email: 'lilly_llama@gmail.com', password: 'password', first_name: "Bro", last_name: "ly") }


    describe 'User validations' do 
        it { should validate_presence_of(:email) }
        it { should validate_uniqueness_of(:email)}
        it { should validate_length_of(:email).is_at_least(3).is_at_most(255)}
        it { should validate_presence_of(:first_name)}
        it { should validate_presence_of(:last_name)}
        it { should validate_presence_of(:password_digest)}
        it { should validate_length_of(:password).is_at_least(6).is_at_most(255)}
    end

    describe 'password encryption' do 
        it 'does not save passwords to the database' do 
            User.create!(email: 'naruto@gmail.com', password:'password', first_name: "naruto", last_name: "Uzamaki")
            naruto = User.find_by(email: 'naruto@gmail.com')
            expect(naruto.password).to_not be("password")
        end

        context 'saves passwords properly' do 
            it 'encrypts the password using BCrypt' do 
                expect(BCrypt::Password).to receive(:create)
                User.new(email:"Sasuke", password:"brooooo")
            end

            it 'properly sets the password reader' do
                user = User.new(email:"Sasuke", password:"brooooo")
                expect(user.password).to eq("brooooo")
              end
        end
    end

    
    
  

end