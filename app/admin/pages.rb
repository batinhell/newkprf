ActiveAdmin.register Page do
  form :partial => "form"
  show do |ad|
        attributes_table do
          row :title
          row :parent_id
          row :description
          row :content do
            sanitize(ad.content)
          end
        end
  end

  index do
    column :title
    default_actions
  end

end
