ActiveAdmin.register Member do
  form :partial => 'form'
  show do |ad|
        attributes_table do
          row :name
          row :description
          row :biography do
            ad.biography.html_safe
          end
          row :image do
            image_tag(ad.image.slider.url)
          end
        end
  end

  index do
    column :name
    column :image do |member|
      image_tag(member.image_url(:slider))
    end
    default_actions
  end


end
