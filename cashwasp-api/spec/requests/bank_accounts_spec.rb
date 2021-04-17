require 'rails_helper'

RSpec.describe "BankAccountsApi", type: :request do
  let!(:user) { create(:user) }
  let!(:bank_accounts) { create_list(:bank_account, 2, user_id: user.id) }
  let(:user_id) { user.id }
  let(:id) { bank_accounts.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /users/:user_id/bank_accounts
  describe 'GET /users/:user_id/bank_accounts' do
    before { get "/users/#{user_id}/bank_accounts", headers: headers }

    context 'when user exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all user bank accounts' do
        expect(json.size).to eq(2)
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
  end

  # Test suite for GET /users/:user_id/bank_accounts/:id
  describe 'GET /users/:user_id/bank_accounts/:id' do
    before { get "/users/#{user_id}/bank_accounts/#{id}", headers: headers }

    context 'when user not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end

    context 'when bank account not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find BankAccount/)
      end
    end

    context 'when bank account exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns bank account' do
        expect(json['id']).to eq(id)
      end
    end
  end

#  etc. etc.
end
