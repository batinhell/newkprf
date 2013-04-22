ActiveAdmin.register Post do
  config.per_page = 2
  form :partial => "form"
  show do |ad|
        attributes_table do
          row :title
          row :in_slider
          row :description do
            sanitize(ad.description) 
          end
          row :image do
            image_tag(ad.image_url(:thumb).to_s)
          end
          row :member_id do
            link_to ad.members.name, admin_member_path(ad.members) if ad.members.present?
          end
          row :ruso
          row :rus_lad
        end
  end

  index do
    column :title do |post|
      link_to post.title, admin_post_path(post)
    end
    
    default_actions
  end

  filter :title
  filter :in_slider
  filter :members

  controller do
    def create
      @post = Post.new(params[:post])
      if @post.save
        if params[:post][:image].present?
          render :crop, :layout => "active_admin" 
        else
          redirect_to [:admin, @post], notice: 'Post was successfully created.'
        end
      else
        render :new
      end
    end

    def update
      @post = Post.find(params[:id])
      if @post.update_attributes(params[:post])
        if params[:post][:image].present?
          render :crop, :layout => "active_admin" 
        else
          redirect_to [:admin, @post], notice: 'Successfully updated post.'
        end
      else
        render :new
      end
    end
  end

end
