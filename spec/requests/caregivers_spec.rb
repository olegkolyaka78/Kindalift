require 'rails_helper'
RSpec.describe "CaregiversControllers", type: :request do
  describe "get caregivers_path" do
    it "renders the index view" do
      FactoryBot.create_list(:caregiver, 10)
      get caregivers_path
      #expect(response).to render_template(:index)
      expect(response).to render_template("caregivers/index.html.erb", layout: "application")
      #expect(response).to render_template("caregivers/index")
    end
  end
  describe "get caregiver_path" do
    it "renders the :show template" do
      caregiver = FactoryBot.create(:caregiver)
      get caregiver_path(id: caregiver.id)
      expect(response).to render_template(:show)
    end
    it "redirects to the index path if the caregiver id is invalid" do
      get caregiver_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to caregivers_path
    end
  end
  describe "get new_caregiver_path" do
    it "renders the :new template" do
    get caregiver_path("new")
    expect(response).to render_template(:new)
    end
  end
  describe "get edit_caregiver_path" do
    it "renders the :edit template" do
      caregiver = FactoryBot.create(:caregiver)
      get edit_caregiver_path(caregiver.id)
      expect(response).to render_template(:edit)
      end
  end
  describe "post caregivers_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      caregiver_attributes = FactoryBot.attributes_for(:caregiver)
      expect { post caregivers_path, params: {caregiver: caregiver_attributes}
    }.to change(Caregiver, :count)
      expect(response).to redirect_to caregiver_path(id: Caregiver.last.id)
    end
  end
  describe "post caregivers_path with invalid data" do
    it "does not save a new entry or redirect" do
      caregiver_attributes = FactoryBot.attributes_for(:caregiver)
      caregiver_attributes.delete(:first_name)
      expect { post caregivers_path, params: {caregiver: caregiver_attributes}
    }.to_not change(Caregiver, :count)
      expect(response).to render_template(:new)
    end
  end
  describe "put caregiver_path with valid data" do
    it "updates an entry and redirects to the show path for the caregiver" do
      caregiver = FactoryBot.create(:caregiver)
      put caregiver_path(id: caregiver.id), params: {caregiver: {first_name: "Welcome"}}
      caregiver.reload
      expect(caregiver.first_name).to eq("Welcome")
      expect(response).to redirect_to caregiver_path(id: caregiver.id)
    end
  end
  describe "put caregiver_path with invalid data" do
    it "does not update the caregiver record or redirect" do
      caregiver = FactoryBot.create(:caregiver)
      put caregiver_path(id: caregiver.id), params: {caregiver: {email: "welcome.com"}}
      caregiver.reload
      expect(caregiver.email).to_not eq("welcome.com")
      expect(response).to render_template(:edit)
    end
  end
  describe "delete a caregiver record" do
    it "deletes a caregiver record" do
      caregiver = FactoryBot.create(:caregiver)
      caregiver.destroy
      expect(Caregiver.exists?(caregiver.id)).to be_falsey
    end
  end
end

