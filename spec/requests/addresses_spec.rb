require 'rails_helper'
RSpec.describe "AddressesControllers", type: :request do
  describe "get addresses_path" do
    it "renders the index view" do
      FactoryBot.create_list(:address, 10)
      get addresses_path
      expect(response).to render_template(:index)
    end
  end
  describe "get address_path" do
    it "renders the :show template" do
      address = FactoryBot.create(:address)
      get address_path(id: address.id)
      expect(response).to render_template(:show)
    end
    it "redirects to the index path if the address id is invalid" do
      get address_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to addresses_path
    end
  end
  describe "get new_address_path" do
    it "renders the :new template" do
      get address_path("new")
      expect(response).to render_template(:new)
    end
  end
  describe "get edit_address_path" do
    it "renders the :edit template" do
      address = FactoryBot.create(:address)
      get edit_address_path(address.id)
      expect(response).to render_template(:edit)
    end
  end
  describe "post addresses_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      address_attributes = FactoryBot.attributes_for(:address)
      expect { post addresses_path, params: {address: address_attributes}
    }.to change(Address, :count)
      expect(response).to redirect_to address_path(id: Address.last.id)
    end
  end
  describe "post addresses_path with invalid data" do
    it "does not save a new entry or redirect" do
      address_attributes = FactoryBot.attributes_for(:address)
      address_attributes.delete(:name)
      expect { post addresses_path, params: {address: address_attributes}
    }.to_not change(Address, :count)
      expect(response).to render_template(:new)
    end
  end
  describe "put address_path with valid data" do
    it "updates an entry and redirects to the show path for the address" do
      address = FactoryBot.create(:address)
      put address_path(id: address.id), params: {address: {name: "1 Home drive, Cary NC"}}
      address.reload
      expect(address.name).to eq("1 Home drive, Cary NC")
      expect(response).to redirect_to address_path(id: address.id)
    end
  end
  describe "delete an address record" do
    it "deletes an address record" do
      address = FactoryBot.create(:address)
      address.destroy
      expect(Address.exists?(address.id)).to be_falsey
  end
end
end
