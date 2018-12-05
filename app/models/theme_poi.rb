class ThemePoi < ApplicationRecord
  belongs_to :theme
  belongs_to :poi
end
