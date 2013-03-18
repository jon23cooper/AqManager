require 'factory_girl'

FactoryGirl.define  do
  factory :parameter do
    name "calcium"
    units "ppm"
    ocean_max {rand(10)}
    ocean_norm {rand(10)}
    ocean_min {rand(10)}
    tank_max {rand(10)}
    tank_optimum {rand(10)}
    tank_min {rand(10)}
  end
end