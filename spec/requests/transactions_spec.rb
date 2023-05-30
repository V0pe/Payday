require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /index' do
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
          category_id = category.id
          )
      end
    before(:each) do
      user.save
      category.save
      transaction.save
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'renders index template' do
      get '/categories'
      expect(response).to render_template(:index)
    end

    it 'renders a successful response' do
      get '/categories'
      expect(response).to be_successful
    end

    it 'Test if Categories is loading correctly the body and have as title categories' do
      get '/categories'
      expect(response.body).to include('Categories')
    end

    it 'Test if Categories is loading correctly the body and have the New inventory button' do
      get '/categories'
      expect(response.body).to include('add a new category')
    end

    it 'Test if categories is loading correctly the body' do
      get '/categories'
      expect(response.body).to include('Category 1')
    end

    it 'Test if inventory is the one that wecreated' do
      get '/categories'
      expect(response.body).to include('Category 1')
      expect(response.body).to include('This is my category')
    end
  end
end