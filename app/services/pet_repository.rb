class PetRepository
  def self.create(attrs)
    Pet.create!(attrs)
  end

  def self.out_of_zone_summary
    Pet.where(in_zone: false).group(:pet_type, :tracker_type).count
  end
end