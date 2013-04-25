ActiveAdmin.register Member do
  form :partial => 'form'
  
  show do |ad|
    attributes_table do
      row :image do
        image_tag(ad.image.slider.url)
      end
      row :name
      row :description
      row :biography do
        ad.biography.html_safe
      end
      row :department_id do
        ad.department.name
      end
    end
  end

  index do
    column :name do |member|
      link_to member.name, [:admin, member] 
    end
    column :image do |member|
      image_tag(member.image.thumb.url)
    end
    default_actions
  end

  filter :name

  

end
