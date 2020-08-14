class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates_with TitleValidator, :if => :title

    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid option" }
end
