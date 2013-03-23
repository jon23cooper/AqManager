class Parameter < ActiveRecord::Base

  has_many :testresults

  validates :name, :presence => true
  validates :units, :presence => true
  validates :ocean_max, :numericality => true, :allow_nil => true
  validates :ocean_norm, :numericality => true, :allow_nil => true
  validates :ocean_min, :numericality => true, :allow_nil => true
  validates :tank_max, :numericality => true, :allow_nil => true
  validates :tank_optimum, :numericality => true, :allow_nil => true
  validates :tank_min, :numericality => true, :allow_nil => true
end
