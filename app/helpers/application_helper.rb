module ApplicationHelper
  def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / max.count * (classes.size - 1)
      yield(tag, classes[index.round])
    end
  end
end

def current_dish
  @current_dish ||= Dish.find_by(params[:id])
end

def current_review
  @current_review ||= Review.find_by(params[:id])
end
