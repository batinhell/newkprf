ActiveAdmin.register Document do
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :file, :as => :file
    end
    f.buttons
  end

  show do |ad|
    attributes_table do
      row :name
      row :file
    end
  end

  index do
    column :name do |document|
      link_to document.name, admin_document_path(document)
    end
    
    default_actions
  end
end
