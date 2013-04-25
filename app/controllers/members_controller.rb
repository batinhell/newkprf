class MembersController < InheritedResources::Base
  def show
    @member = Member.find(params[:id])
    @related_news = @member.posts
  end

  def index
    @departments = Department.includes(:members).limit(10)
  end
end
