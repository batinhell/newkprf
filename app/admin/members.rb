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

  controller do
    def create
      @member = Member.new(params[:member])
      if @member.save
        if params[:member][:image].present?
          render :crop, :layout => "active_admin" 
        else
          redirect_to [:admin, @member], notice: 'Post was successfully created.'
        end
      else
        render :new
      end
    end

    def update
      @member = Member.find(params[:id])
      if @member.update_attributes(params[:member])
        if params[:member][:image].present?
          render :crop, :layout => "active_admin" 
        else
          redirect_to [:admin, @member], notice: 'Successfully updated post.'
        end
      else
        render :new
      end
    end
  end

end
