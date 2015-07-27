class Recipe < ActiveRecord::Base
  belongs_to :user

  enum type: {main: 0, appetizer: 1, dessert: 2}

  self.inheritance_column = nil


end
