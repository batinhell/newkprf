ActiveAdmin.register Agit do
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :image, :as => :file, :label => "File"
      f.input :file, :as => :file, :label => "Image"
    end
    f.buttons
  end

  show do |ad|
    attributes_table do
      row :name
      row :image
    end
  end

  index do
    column :name do |agit|
      link_to agit.name, admin_agit_path(agit)
    end
    
    default_actions
  end

end
