module ExperiencesHelper
  def self.get_search_results(keyword)
    results = []
    PgSearch.multisearch(keyword).each do |object|
      if object.searchable_type == "Dish"
        results << object.searchable.experience unless results.include?(object.searchable.experience)
      elsif object.searchable_type == "User"
        results += object.searchable.experiences
      elsif object.searchable_type == "Experience"
        results << object.searchable
      end
    end
    Dish.venue_search(keyword).each do |object|
      results << object.experience unless results.include?(object.experience)
    end
    return results
  end
end
