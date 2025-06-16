class PetRepository
  def self.create(attributes)
    Pet.create!(attributes)
  end

  def self.out_of_zone_summary
    PetSummaryService.call
  end
end