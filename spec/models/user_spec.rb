require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject do
      User.new(
        id: 1,
        name: 'John',
        email: 'johndoe@gmail.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
    end
    
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid with a password less than the minimum length' do
      subject.password = 'doe'
      expect(subject).to_not be_valid
      print ".errors.full_messages === "
      print subject.errors.full_messages
    end

    it 'is not valid without a email' do
      subject.email = nil
      expect(subject).to_not be_valid
      print ".errors.full_messages === "
      print subject.errors.full_messages
    end

    context 'should not have 2 users with same email' do
      let! (:user2) { User.create(name: 'user2', email: 'johndoe@GMAIL.com', password: '123456', password_confirmation: '123456') }
      it { is_expected.to_not be_valid }
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
      print ".errors.full_messages === "
      print subject.errors.full_messages
    end
  end
  
  describe '.authenticate_with_credentials' do
    let!(:user) { User.create!(name: 'John', email: 'johndoe@gmail.com', password: 'password123', password_confirmation: 'password123') }

    it 'should return nil if authentication fails' do
      result = User.authenticate_with_credentials('john@test.com', 'password')
      expect(result).to be_nil
    end

    it 'should return the user if authentication passes' do
      result = User.authenticate_with_credentials('johndoe@gmail.com', 'password123')
      expect(result).to be_present
    end

    it 'is valid with whitespace before or after email' do
      result = User.authenticate_with_credentials(' johndoe@gmail.com ', 'password123')
      expect(result).to be_present
    end

    it 'is valid regardless of casing in email' do
      result = User.authenticate_with_credentials(' johndoe@GmaIL.com ', 'password123')
      expect(result).to be_present
    end

  end
 
end