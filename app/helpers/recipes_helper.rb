module RecipesHelper
  def difficulty_badge(d)
    color = { "Easy"=>"success", "Medium"=>"warning", "Hard"=>"danger" }[d] || "secondary"
    content_tag :span, d, class: "badge text-bg-#{color}"
  end
end
