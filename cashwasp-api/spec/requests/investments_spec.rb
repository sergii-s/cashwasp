require 'rails_helper'

RSpec.describe "Investments", type: :request do
  let!(:user) { create(:user) }
  let!(:bank_accounts) { create_list(:bank_account, 2, user_id: user.id) }
  let(:user_id) { user.id }
  let(:headers) { valid_headers }
  let(:attributes) { { source: bank_accounts.first.id, destination: bank_accounts.second.id, amount: 1000.0 } }

  describe 'POST /users/:user_id/invest' do
    before { post "/users/#{user_id}/invest", params: attributes.to_json, headers: headers }

    context 'when first investment' do
      let(:attributes) { { source: bank_accounts.first.id, amount: 1000.0 } }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when user exists' do
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when user not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end

    context 'when source bank account not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end
end
