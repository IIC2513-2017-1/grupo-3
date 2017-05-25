class Dish < ApplicationRecord
  validates :price, presence: true
  validates :name, presence: true, length: { maximum: 25 }
  validates :description, presence: true, length: { maximum: 200 }

  has_and_belongs_to_many :categories
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :cart_items
  has_many :carts, through: :cart_items
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :reviews

  # default_scope { where(active: true) }

  def self.search(search)
    if search
      self.where("(user_id like ? OR user_id like ?) OR (category like ? OR category like ?)", "#{search}%", "% #{search}%", "#{search}%", "% #{search}%")
    else
      self.all
    end
  end

  def self.tagged_with(name)
    Tag.find_by!(name: name).dishes
  end

  def self.tag_counts
    Tag.select("tags.id, tags.name,count(taggings.tag_id) as count").
    joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def avg_forks
    count = 0
    reviews.each do |review|
      count += 0 unless review.rate.forks
    end
    count / rates.size
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

end
