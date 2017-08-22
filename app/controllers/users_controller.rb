class UsersController < ApplicationController
   def index
    @users = User.paginate(page: params[:page],per_page: 4)
   end
   
   def signup
    @user = User.new
   end    
      
   def create
    #render plain: params[:user].inspect
    @user = User.new(user_params)
     if @user.save
        flash[:success] = "User was successfully created"
        redirect_to articles_path
     else
        render 'signup'
     end
   end
    
   def show
     @user = User.find(params[:id])
   end
    
   def edit
     @user = User.find(params[:id])    
   end    
    
   def update
     @user = User.find(params[:id])   
     if @user.update(user_params)
        flash[:success] = "Your account info was successfully updated"
        redirect_to articles_path
     else
         render 'edit'
     end 
   end    

   def user_params
     params.require(:user).permit(:username,:email,:password)
   end   
end