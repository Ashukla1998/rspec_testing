require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do 
    # it "will create a user when all fields are correct" do 
    #   user = User.new(name:"Ashu",surname:"Shukla",email:"shulaashu134@gmail.com",username:"Ashu1998",password:"Ashu1234@",mobile:7987718167)
    #   expect(user.save).to eq(true)
    # end
    it "will create a user when all fields are correct" do 
      user = build(:user)
      expect(user.save).to eq(true)
    end

    it "will create a user when name is less than or equal to 2 " do 
      user = build(:user,name: " ")
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("is too short (minimum is 2 characters)")
    end

    it "will create a user when surname is not more than 32 and surname is null" do 
      user = build(:user,surname: " ")
      expect(user).not_to be_valid
      expect(user.errors[:surname]).to eq(["can't be blank"])
    end
    
    it "will create a user when email is not unique" do 
      user = build(:user, email:"huklaashu134@gmail.com")
      user.save  
      user = build(:user, email:"huklaashu134@gmail.com")
      user.save
      expect(user.errors[:email]).to eq(["has already been taken"])
    end

    it "will create a user when email is not present" do 
      user = build(:user, email:"")
      user.save  
      expect(user.errors[:email]).to eq(["can't be blank", "is invalid"])
    end
    
    it "will create a user when email is not present" do 
      user = build(:user, email:"")
      user.save  
      expect(user.errors[:email]).to eq(["can't be blank", "is invalid"])
    end

    it "will create a user when username is not present" do 
      user = build(:user, username:"")
      user.save  
      expect(user.errors[:username]).to eq(["can't be blank", "is invalid"])
    end

    it "will create a user when username is not unique" do 
      user = build(:user, username:"Ashu123")
      user.save
      user = build(:user, username:"Ashu123")
      user.save  
      expect(user.errors[:username]).to eq(["has already been taken"])
    end

    it "will create a user when mobile is not unique" do 
      user = build(:user, mobile:7987718167)
      user.save
      user = build(:user, mobile:7987718167)
      user.save  
      expect(user.errors[:mobile]).to eq(["has already been taken"])
    end

    it "will create a user when mobile is not present" do 
      user = build(:user, mobile: nil)
      user.save  
      expect(user.errors[:mobile]).to eq(["can't be blank", "is the wrong length (should be 10 characters)"])
    end

    it "will create a user when password is not present" do 
      user = build(:user, password: " ")
      user.save  
      expect(user.errors[:password]).to eq(["is invalid"])
    end
  end
end
