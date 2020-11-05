class Semester < ApplicationRecord
  has_many :sections

  before_validation :capitalize_semester
  validates :semester, inclusion: { in: ["Fall","Spring","Summer"] }
  validates_uniqueness_of :semester

  def capitalize_semester
    self.semester = self.semester.capitalize
  end

  def self.search_semester(search)
    if search
      search = search.capitalize
      semes = Semester.where("semester LIKE ?", search + "%")
      if semes
        where(id: semes)
      else
        @semesters = Semester.all
      end
    else
      @semesters = Semester.all
    end
  end

end
