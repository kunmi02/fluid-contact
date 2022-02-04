require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:user, password: user.password)
  end

  # User signup test suite
  describe 'POST /api/users/api/users/signup' do
    context 'when valid request' do
      before { post '/api/users/signup', params: valid_attributes.to_json, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(200)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    # context 'when invalid request' do
    #   before { post '/api/users/signup', params: {}, headers: headers }

    #   it 'does not create a new user' do
    #     expect(response).to raise_error(ActiveRecord::RecordInvalid)
    #   end

    #   it 'returns failure message' do
    #     expect(json['message'])
    #       .to match(//)
    #   end
    # end
  end
end
