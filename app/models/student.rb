class Student < ApplicationRecord
  has_many :sections_student
  has_many :sections, through: :sections_student

  before_validation :titleize_name
  validates :name, length: { maximum: 100 }, presence: true
  validates :identifier, inclusion: {in: (900000000..900999999)}
  validates_uniqueness_of :identifier

  def titleize_name
    self.name = self.name.titleize
  end

  def self.search_student(search)
    if search
      search = search.titleize
      stud = Student.where("name LIKE ?", search + "%")
      if stud
        self.where(id: stud)
      else
        @students = Student.all
      end
    else
      @students = Student.all
    end
  end

end
