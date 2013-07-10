class Post < ActiveRecord::Base
  validates :name, presence: true,
                   length: {maximum: 100, minimum: 3}
  validates :title, presence: true,
                    length: {maximum: 100, minimum: 3}
  validates :body, presence: true
end
