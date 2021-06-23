class Question < ApplicationRecord
  belongs_to :enquete
  has_many :forms, dependent: :destroy
  has_many :results
  validates :content, presence: true
  
  def form_count_check
    num = forms.first.title.split(',').count
    return num
  end

  
end
