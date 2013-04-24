class AlbumsController < InheritedResources::Base
    def show
    @album = Album.find(params[:id])
    @photos = @album.photos
    render :layout => 'album'
  end
end
