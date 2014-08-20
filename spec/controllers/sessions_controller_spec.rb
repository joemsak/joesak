require 'rails_helper'

describe SessionsController do
  describe 'GET #destroy' do
    it 'clears the profile_id from the session' do
      session[:authenticated_id] = 1
      get :destroy
      expect(session[:authenticated_id]).to be_nil
    end
  end
end
