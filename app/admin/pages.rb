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
    column :title do |page|
      link_to page.title, [:admin, page ] 
    end
    default_actions
  end

  filter :title
  filter :parent

end
