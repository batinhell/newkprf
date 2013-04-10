ActiveAdmin.register Album do
  form :partial => "form"

  index do
    column :name do |album|
      link_to album.name, [:admin, album]
    end
    default_actions
  end

  show do
    panel "Photos" do
      table_for album.photos do |t|
        t.column("Title") { |photo| link_to photo.description, admin_photo_path(photo) }
        t.column("Photo") { |photo| image_tag photo.image.thumb.url }
      end
    end
  end

end
