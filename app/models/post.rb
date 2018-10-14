class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  validate :title_contains?

  @@keywords = [ /Won't Believe/i, /Secret/i, /Top [0-9]*/i,  /Guess/i]

    def title_contains?
      if !@@keywords.any? { |word| word.match title }
       errors.add(:title, "Must be clickbait")
      end
    end


end ### End of Post Class
