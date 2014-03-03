class NewsPostsController < ApplicationController
  
  before_action :authorize_for_news_posts, except: [:index, :show]

  def index
  	@news_posts = NewsPost.all
   # "binding.pry" allows to stop the running of code to debug
  end

  def show
  	@news_post = NewsPost.find(params[:id])
  end

  def new
    @news_post = NewsPost.new
  end

  def edit
    #Get the id of the newpost the user is on when the link to edit is clicked. Use that id to enable edit functionality for the correct newspost
    @news_post = NewsPost.find(params[:id])
  end

#Rails strong parameters needed when have ForbiddenAttributesError
  def create
    @news_post = NewsPost.new(news_post_params)

    if @news_post.save
      redirect_to @news_post
    else
      #Do something else
    end

  end

  #to take the edit page's form data and store it in 
  def update
    @news_post = NewsPost.find(params[:id])
    if @news_post.update(news_post_params)
      redirect_to @news_post
    else
      # TBD
    end
  end

  def destroy
    @news_post = NewsPost.find(params[:id])
    @news_post.destroy
    redirect_to news_posts_path
  end

  private

  def authorize_for_news_posts
    if current_user.nil?
      redirect_to root_path
    end
  end

    #method to have strong parameter for the create method mass assignment situation
    #sanitizes the input
    def news_post_params
    params.require(:news_post).permit(:title, :body)   
    end

end
