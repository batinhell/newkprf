ActiveAdmin.register Post do
  form :partial => "form"
  show do |ad|
        attributes_table do
          row :title
          row :description do
            sanitize(ad.description)
          end
          row :image do
            image_tag(ad.image.url(:thumb))
          end
        end
  end

  index do
    column :title
    # column :description do |post|
    #   sanitize(post.description)
    # end
    column :image do |post|
      image_tag(post.image_url(:thumb))
    end
    default_actions
  end

end
