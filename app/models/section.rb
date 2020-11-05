class Section < ApplicationRecord
  belongs_to :course
  belongs_to :professor
  belongs_to :semester
  has_many :sections_student
  has_many :students, through: :sections_student

  validates :year, inclusion: {in: (1980..2021)}
  validates :course_id, presence: true
  validates :professor_id, presence: true
  validates :semester_id, presence: true

  def self.search_section(search)
    if search
      search = search.titleize
      prof = Professor.where("name LIKE ?", search + "%")
      if prof
        self.where(professor_id: prof)
      else
        @sections = Section.all
      end
    else
      @sections = Section.all
    end
  end

end
