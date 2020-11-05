class Professor < ApplicationRecord
  has_many :sections

  before_validation :titleize_name
  before_validation :capitalize_office
  validates :name, length: { maximum: 100 }, presence: true
  validates_length_of :office, is: 5
  validates :office, format: {with: /\A[A-Z][0-9]{4}\z/}
  validates_uniqueness_of :office

  def titleize_name
    self.name = self.name.titleize
  end

  def capitalize_office
    self.office = self.office.capitalize
  end

  def self.search_professor(search)
    if search
      search = search.titleize
      prof = Professor.where("name LIKE ?", search + "%")
      if prof
        self.where(id: prof)
      else
        @professors = Professor.all
      end
    else
      @professors = Professor.all
    end
  end

end
