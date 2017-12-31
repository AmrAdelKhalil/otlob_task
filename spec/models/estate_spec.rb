require 'rails_helper'

RSpec.describe Estate, :type => :model do

  context "Valid CRUD operations" do
    subject do
      {
        street: "51 OMAHA CT", city: "SACRAMENTO", zip: "90823", state: "CA", beds: 3, baths: 1, sq_ft: 1167.0, estate_type: "Residential", sale_date: "2008-05-21", price: 68212.0, latitude: 38.478902, longitude: -121.431028
      }
    end

    it 'Create a new estate' do
      expect {
        Estate.create!(subject)
      }.to change(Estate, :count).by(1)
    end

    it 'Show a estate' do
      new_estate = Estate.create!(subject)
      expect(Estate.find_by_id(new_estate)).not_to be_nil
    end

    it 'Update a new estate' do
      new_estate = Estate.create!(subject)
      subject["city"] = "Imbaba"
      new_estate.update!(subject)
      expect(new_estate.city).to eq("Imbaba")
    end

    it 'Delete a new estate' do
      new_estate = Estate.create!(subject)
      expect{
        new_estate.destroy!
      }.to change(Estate, :count).by(-1)
    end
  end

  context "Invalid CRUD operations" do
    subject do
      {
        street: "51 OMAHA CT", city: "SACRAMENTO", zip: "90823", state: "CA", beds: 3.5, baths: 1.23, sq_ft: 1167.0, estate_type: "Residential", sale_date: "2008-05-21", price: "68212.0", latitude: "38.478902", longitude: "-121.431028"
      }
    end

    it 'Create an invalid estate' do
      expect{
        Estate.create(subject)
      }.to change(Estate, :count).by(0)
    end

    it 'Update an estate with invalid data' do
      new_estate = Estate.create({street: "51 OMAHA CT", city: "SACRAMENTO", zip: "90823", state: "CA", beds: 3, baths: 1, sq_ft: 1167.0, estate_type: "Residential", sale_date: "2008-05-21", price: 68212.0, latitude: 38.478902, longitude: -121.431028})

      new_estate.update(subject)
      expect(new_estate.beds).not_to eq(3.5)
    end
  end
end
