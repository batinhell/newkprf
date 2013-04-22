class MembersController < InheritedResources::Base
  def show
    @member = Member.find(params[:id])
    @related_news = @member.posts
  end
end
