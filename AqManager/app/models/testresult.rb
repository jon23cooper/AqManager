class Testresult < ActiveRecord::Base
  belongs_to :parameter
  validates :value, :presence => true, :numericality => true
  validates :testresult_date, :presence => true, :numericality => true
  validates :note, :length => { :minimum => 10}, :allow_blank => true
end
