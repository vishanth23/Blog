class PostsController < ApplicationController
def index
if session[:adm_id]
if params[:search]
@posts=Post.where(['lastname like ?',"%#{params[:Search]}%"])
else
@posts=Post.all
end
else
@users=current_user.posts
end
end

def new

@post =Post.new
end

def create
if session[:adm_id]	
@post =Post.new(post_params)
if @post.save
redirect_to posts_path, :notice => "your post has been saved"
else
render "new"
end
else	
#params.permit!
@post =current_user.posts.build(post_params)
respond_to do |format|
if @post.save
format.html{ redirect_to posts_path, :notice => "your post has been saved"}
	else
render "new"
end
end
end
end
def show
@post=Post.find(params[:id])
end

def edit
@post=Post.find(params[:id])

end

def update
@post=Post.find(params[:id])
if @post.update_attributes(post_params)
redirect_to posts_path

end
end
def destroy
@post=Post.find(params[:id])
if @post.destroy
redirect_to posts_path
end
end
def post_params
params.require(:post).permit(:firstname,:lastname,:feedback)
end
end