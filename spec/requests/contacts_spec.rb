require 'rails_helper'

RSpec.describe 'Contacts API', type: :request do
  # initialize test data
  # add contqct owner owner
  let(:user) { create(:user) }
  let!(:contacts) { create_list(:contact, 10, created_by: user.id) }
  let(:contact_id) { contacts.first.id }
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /contacts
  describe 'GET /contacts' do
    # make HTTP get request before each example
    before { get '/contacts', params: {}, headers: headers }

    it 'returns contacts' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /contacts/:id
  describe 'GET /contacts/:id' do
    before { get "/contacts/#{contact_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the contact' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(contact_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:contact_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Contact/)
      end
    end
  end

  # Test suite for POST /contacts
  describe 'POST /contacts' do
    # valid payload
    let(:valid_attributes) { { email: 'email@email.com', created_by: user.id.to_s, address: '1 hey streey' } }

    context 'when the request is valid' do
      before { post '/contacts', params: valid_attributes.to_json, headers: headers }

      it 'creates a contact' do
        expect(json['email']).to eq('email@email.com')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { email: nil }.to_json }
      before { post '/contacts', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Email can't be blank/)
      end
    end
  end

  # Test suite for PUT /contacts/:id
  describe 'PUT /contacts/:id' do
    let(:valid_attributes) { { email: 'email@email.com' } }

    context 'when the record exists' do
      before { put "/contacts/#{contact_id}", params: valid_attributes.to_json, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /contacts/:id
  describe 'DELETE /contacts/:id' do
    before { delete "/contacts/#{contact_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
