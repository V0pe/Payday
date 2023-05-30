require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:user) do
    User.create!(
      name: 'Victor',
      email: 'victor@mail.com',
      password: '1234567'
    )
  end
  let(:category) do
    Category.create!(
      name: 'Category 1',
      icon: 'This is my category',
      user_id: user.id
    )
  end
  let(:transaction) do
    Transaction.create!(
      name: 'transaction 1',
      amount: 23,
      user_id: user.id,
      category_id: category.id
    )
  end
  describe 'attributes' do
    it 'Should have a name' do
      expect(transaction.name).to eq('transaction 1')
    end

    it 'Should have an amount' do
      expect(transaction.amount).to eq(23.0)
    end
  end
end
