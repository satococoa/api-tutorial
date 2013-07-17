class Post < ActiveRecord::Base
  validates :name, presence: true,
                   length: { in: 3..100 }
  validates :title, presence: true,
                    length: { in: 3..100 }
end
