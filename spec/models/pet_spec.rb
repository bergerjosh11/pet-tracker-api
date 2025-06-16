require 'rails_helper'

RSpec.describe Pet, type: :model do
  it "is invalid without required fields" do
    pet = Pet.new
    expect(pet).not_to be_valid
    expect(pet.errors[:pet_type]).to be_present
  end

  it "validates inclusion of pet_type" do
    expect(Pet.new(pet_type: "Lizard")).not_to be_valid
  end
end