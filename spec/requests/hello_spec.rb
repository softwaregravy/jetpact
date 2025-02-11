require 'rails_helper'

RSpec.describe "Hello", type: :request do
  describe "GET /hello" do
    it "returns a success response" do
      get '/hello'
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('Hello')
    end
  end
end
