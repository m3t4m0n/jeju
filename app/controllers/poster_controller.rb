class PosterController < ApplicationController

    def index
      @every_post=Poster.order("posters.like desc").all
    end
    def create
     
    end
  
    def upload
    
      @user_id=Poster.new
      @user_id.title=params[:title]
      @user_id.intro=params[:intro]
      @user_id.host=params[:host]
      @user_id.place=params[:place]
      @user_id.title = params[:title]
      @user_id.user_id=current_user.id
      @user_id.category=params[:category]
      @user_id.start_date=params[:start_date]
      @user_id.end_date=params[:end_date]
      @user_id.tag_list.add(params[:tag_name], parse: true)
      @user_id.image= params[:image]
     
      
      @user_id.save
      
      redirect_to '/poster/index'
    end
    
    def detail
       
        @poster = Poster.find(params[:id])
       
      
        if(@poster.category == 0)
                @category = "대외활동"
        elsif(@poster.category == 1)
                @category = "동아리"
        elsif(@poster.category == 2)
                 @category = "학과 행사"
        elsif(@poster.category ==3)
                 @category = "교내 행사"
        elsif(@poster.category == 4)
                 @category = "장학금"
        elsif(@poster.category == 5)
                 @category = "교외행사"
        elsif(@poster.category == 6)
                 @category = "기타"
        else
            @category = "error"
        end
        puts "like?"
        
        @like = LikePost.where("poster_id = ?", params[:id]).length
        
        @like_user = like_check(current_user.id,params[:id])
        
         
    end
    
    def like 
     
        like = LikePost.find_by(user_id: current_user.id ,
                                poster_id: params[:post_id])
        puts like
        if(like.nil?)
            #create
            puts "like"
            col = LikePost.new
            col.user_id = current_user.id 
            col.poster_id = params[:post_id]
            col.save
        else
            puts "delete"
            like.destroy
        end
        #카운트가 플러스 일 해주는거 
        @count =  LikePost.where("poster_id = ?", params[:post_id]).length
        puts @count
        if request.xhr?
            render :json => {
                                :count => @count,
                            }
        end
    end
    
    #좋아요 체크 기능 
    def like_check(user,post)
         like_user = ""
         puts "조아요눌럿나여?"
         puts LikePost.find_by(user_id: user ,poster_id: post)
         if LikePost.find_by(user_id: user ,poster_id: post)
             puts 'if'
             like_user = "heart heart_off" # 눌럿을때 하트가 밝아야댐
         else
             puts 'else'
             like_user = "heart"
         end
         return like_user
    end
    
    def reply
        
        @reply = Reply.new
        @reply.user_id = params[:user_id]
        @reply.content = params[:content]
        @reply.poster_id = params[:post_id]
        if @reply.save
            if request.xhr?
            render :json => {
                                :user_email => User.find(params[:user_id]).email
                                
                            }
            end
        end
    end
    
    def best
        @every_post = Poster.all
        @ep_title = Array.new { Array.new }
        
        @every_post.each do |ep|
            @ep_title[ep.id] = ep.title
        end
        
    end
end
# 멋쟁이 사자처럼 0 
# 동아리 1
# 학과 행사 2
# 교내 행사 3
# 장학금 4
# 교외 행사 5
# 기타 6
#회원가입 시 email로 받는다. 