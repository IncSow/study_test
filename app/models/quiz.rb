class Quiz < ApplicationRecord
  #TLI that there is only one z to quiz ????
  has_many :questions
  has_many :scores
end
