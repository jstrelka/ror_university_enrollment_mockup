class Department < ApplicationRecord
  has_many :courses

  before_validation :upcase_name
  validates_uniqueness_of :name
  validates :name, length: {in: 2..4}

  def upcase_name
    name.upcase!
  end

  def self.search_department(search)
    if search
      search = search.upcase
      dept = Department.find_by(name: search)
      if dept
        self.where(id: dept)
      else
        @departments = Department.all
      end
    else
      @departments = Department.all
    end
  end

end
