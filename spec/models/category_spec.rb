require 'rails_helper'

RSpec.describe Category, type: :model do
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

  describe 'attributes' do
    it 'Should have a name' do
      expect(category.name).to eq('Category 1')
    end

    it 'Should have an icon' do
      expect(category.icon).to eq('This is my category')
    end
  end
end
