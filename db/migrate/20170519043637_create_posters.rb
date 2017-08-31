class CreatePosters < ActiveRecord::Migration

  def change
    create_table :posters do |t|
      t.integer :user_id, null: false
      t.string :title
      t.string :host, null: false, default: "-" #주최하는곳 
      t.string :place, null: false, default: "-" #개최 장소 
      
      t.text :intro, null: false, default: "-"   #상세소개
      t.string :image, null: false, default: "footer_logo.png" #이미지 
      
      t.datetime :start_date,default: "" #시작일자
      t.datetime :end_date ,default: "" #끝일자 
      
      t.integer :like, default: 0, null: false #좋아요 
      t.integer :category ,default: "1"#분류
      
     

      
     
      t.timestamps null: false
    end
  end
end

#grade
# 멋쟁이 사자처럼 0 
# 동아리 1
# 학과 행사 2
# 교내 행사 3
# 장학금 4
# 교외 행사 5
# 기타 6
#회원가입 시 email로 받는다. 
