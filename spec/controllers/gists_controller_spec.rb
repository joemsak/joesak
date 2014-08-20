require 'rails_helper'

describe GistsController do
  describe 'POST #create' do
    context 'unauthenticated user' do
      it 'redirects to the new session page' do
        post :create
        expect(response).to redirect_to(sign_in_path)
      end
    end
  end
end
