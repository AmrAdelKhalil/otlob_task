require 'rails_helper'

RSpec.describe "Estate APIs", :type => :request do

  context 'features' do

    context 'CRUD' do
      let(:data){
        {
          estate: {
            street: "51 OMAHA CT", city: "SACRAMENTO", zip: "90823", state: "CA", beds: 3, baths: 1, sq_ft: 1167.0, estate_type: "Residential", sale_date: "2008-05-21", price: 68212.0, latitude: 38.478902, longitude: -121.431028
          }
        }
      }

      it 'POST /estats' do
        post '/estates', params: data
        estate = JSON.parse(response.body)
        expect(estate["state"]).to eq("CA")
        expect(response).to have_http_status(:created)
        expect(Estate.find_by_id(estate["id"])).not_to be_nil
      end

      it 'PUT /estats/:id' do
        estate = Estate.create!(data[:estate])
        data[:estate][:city] = "Imbaba"
        put "/estates/#{estate.id}", params: data
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)["city"]).to eq("Imbaba")
      end

      it 'GET /estates/:id' do
        estate = Estate.create!(data[:estate])
        get "/estates/#{estate.id}"
        expect(response).to have_http_status(:found)
      end

      it 'DELETE /estates/:id' do
        estate = Estate.create!(data[:estate])
        expect{
          delete "/estates/#{estate.id}"
        }.to change(Estate, :count).by(-1)
      end

    end

    context 'additional' do
      let(:data){
        {
          estate: {
            street: "51 OMAHA CT", city: "SACRAMENTO", zip: "90823", state: "CA", beds: 3, baths: 1, sq_ft: 1167.0, estate_type: "Residential", sale_date: "2008-05-21", price: 68212.0, latitude: 38.478902, longitude: -121.431028
          }
        }
      }

      it 'GET /estates/paginate' do
        estate1 = Estate.create!(data[:estate])
        estate2 = Estate.create!(data[:estate])
        estate3 = Estate.create!(data[:estate])
        estate4 = Estate.create!(data[:estate])
        estate5 = Estate.create!(data[:estate])

        get '/estates/paginate', params: {page: 1, per_page:2}
        expect(response).to be_success
        resp = JSON.parse(response.body)
        expect(resp.length).to eq(2)
        expect(resp[1]["id"]).to eq(estate2.id)

        get '/estates/paginate', params: {page: 2, per_page:2}
        expect(response).to be_success
        resp = JSON.parse(response.body)
        expect(resp.length).to eq(2)
        expect(resp[1]["id"]).to eq(estate4.id)
      end

      it 'POST /estates/search' do
        
      end
    end
  end
end
