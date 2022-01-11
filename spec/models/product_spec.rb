require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let (:category) { Category.create(name: 'testCategory') }
    subject { Product.new(name: 'test', price_cents: 9000, quantity: 100, category_id: category.id) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
      print ".errors.full_messages === "
      print subject.errors.full_messages
    end

    it 'is not valid without a price' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      print ".errors.full_messages === "
      print subject.errors.full_messages
    end

    it 'is not valid without a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
      print ".errors.full_messages === "
      print subject.errors.full_messages
    end




  end
end