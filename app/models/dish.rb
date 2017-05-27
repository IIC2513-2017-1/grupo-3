class Dish < ApplicationRecord
  validates :price, presence: true
  validates :name, presence: true, length: { maximum: 25 }
  validates :description, presence: true, length: { maximum: 200 }

  has_many :taggings
  has_many :tags, through: :taggings
  has_many :cart_items
  has_many :carts, through: :cart_items
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :reviews

  has_many :categorizings
  has_many :categories, through: :categorizings

  # default_scope { where(active: true) }

  def self.search(search)
    if search
      users_ids = User.where('(lower(first_name) LIKE ? OR lower(last_name) LIKE ?)',
                "#{search}%".downcase, "#{search}%".downcase).ids
      tags_ids = Tag.where('(lower(name) LIKE ? OR lower(name) LIKE ?)',
                "#{search}%".downcase, "% #{search}%".downcase).ids
      # categories_ids = Category.where('(lower(name) LIKE ? OR lower(name) LIKE ?)',
      #                     "#{search}%".downcase, "% #{search}%".downcase).ids
      joins(:taggings).where('(lower(name) LIKE ? OR lower(name) LIKE ?)
            OR (lower(description) LIKE ? OR lower(description) LIKE ?)
            OR (user_id IN (?))
            OR ((taggings.tag_id IN (?)) AND (taggings.dish_id IN (?)))',
      "#{search}%".downcase, "% #{search}%".downcase, "#{search}%".downcase, "% #{search}%".downcase,
      users_ids, tags_ids, ids).distinct
      # query.joins(:categories_dishes).where('((categories_dishes.category_id IN (?)) AND (categories_dishes.dish_id IN (?))',
      #      categories_ids, ids).distinct
    else
      all
    end
  end

  def self.tagged_with(name)
    Tag.find_by!(name: name).dishes
  end

  def self.tag_counts
    Tag.select('tags.id, tags.name,count(taggings.tag_id) as count').
    joins(:taggings).group('taggings.tag_id, tags.id, tags.name')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def avg_forks
    reviews.sum(:forks).to_f / reviews.size
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def self.categorized_with(name)
    Category.find_by!(name: name).dishes
  end

  def self.category_counts
    Category.select('categories.*, count(categorizings.tag_id) as count').joins(:categorizings).group('categorizings.category_id')
  end

  def category_list
    categories.map(&:name).join(', ')
  end

  def category_list=(names)
    self.categories = names.split(',').map do |n|
      Category.where(name: n.strip).first_or_create!
    end
  end

end
