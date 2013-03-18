class Parameter < ActiveRecord::Base
  validates :name, :presence => true
  validates :units, :presence => true
  validates :ocean_max, :numericality => true
  validates :ocean_norm, :numericality => true
  validates :ocean_min, :numericality => true
  validates :tank_max, :numericality => true
  validates :tank_optimum, :numericality => true
  validates :tank_min, :numericality => true
end
