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
            image_tag(ad.image.slider.url)
          end
        end
  end

  index do
    column :title
    column :image do |post|
      image_tag(post.image_url(:slider))
    end
    default_actions
  end


  controller do
    def create
      @post = Post.new(params[:post])
      if @post.save
        if params[:post][:image].present?
          render :crop, :layout => "active_admin" 
        else
          redirect_to @post, notice: 'Post was successfully created.'
        end
      else
        render :new
      end
    end
  end

end
