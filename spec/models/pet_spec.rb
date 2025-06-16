require 'rails_helper'

RSpec.describe Pet, type: :model do
  context "validations" do
    it "is invalid without required fields" do
      pet = Pet.new
      expect(pet).not_to be_valid
      expect(pet.errors[:pet_type]).to be_present
      expect(pet.errors[:tracker_type]).to be_present
      expect(pet.errors[:owner_id]).to be_present
      expect(pet.errors[:in_zone]).to be_present
    end

    it "is invalid with an unsupported pet_type" do
      pet = Pet.new(pet_type: "Lizard", tracker_type: "small", owner_id: 1, in_zone: true)
      expect(pet).not_to be_valid
      expect(pet.errors[:pet_type]).to include("is not included in the list")
    end

    it "is valid with required fields" do
      pet = Pet.new(pet_type: "Dog", tracker_type: "medium", owner_id: 1, in_zone: false)
      expect(pet).to be_valid
    end
  end
end