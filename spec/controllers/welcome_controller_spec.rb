require 'spec_helper'

describe WelcomeController do

  describe 'get index' do
    it "is successful" do
      get :index
      expect(response).to be_successful
    end

    it 'redirects if there is a current_user' do
      # get :index
      # current_user = build(:user)
      # assigns(:current_user)
      # expect(response).to be_successful
    end
  end
end