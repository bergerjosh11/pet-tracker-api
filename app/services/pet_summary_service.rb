class PetSummaryService
  def self.call
    summary = Pet.where(in_zone: false).group(:pet_type, :tracker_type).count

    summary.each_with_object(Hash.new { |h, k| h[k] = {} }) do |((pet_type, tracker_type), count), result|
      result[pet_type][tracker_type] = count
    end
  end
end