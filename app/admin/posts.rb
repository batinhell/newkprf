ActiveAdmin.register Post do
  form :partial => "form"
  show do |ad|
        attributes_table do
          row :title
          row :in_slider
          row :description do
            sanitize(ad.description)
          end
          row :image do
            image_tag(ad.image.thumb.url)
          end
        end
  end

  index do
    column :title
    column :image do |post|
      image_tag(post.image_url(:thumb))
    end
    default_actions
  end

end
