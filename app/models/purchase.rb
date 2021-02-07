class Purchase < ApplicationRecord
    belongs_to :comics
    belongs_to :users
end
