# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


=begin
User.create(
        email: "example@gmail.com",
        password: "12345678"
    )

Poster.create(
        user_id: 1,
        host: "멋쟁이 사자처럼",
        place: "광교 문화 센터 허브 홀",
        intro: "안녕하세요. 멋쟁이사자처럼 경기 하프톤 입니다.",
        image: "poster/poster-1.png",
        start_date: "2017/05/27",
        end_date: "2017/05/27",
        category: 0
      )
Poster.create(
        user_id: 1,
        host: "한국 IT 경영학회",
        place: "Naver D.camp",
        intro: "안녕하세요. 안녕하세요.한국대학생 IT경영학회에서 강연회를 진행합니다.",
        image: "poster/poster-2.png",
        start_date: "2017/05/20",
        end_date: "2017/05/20",
        category: 5
      )

Poster.create(
        user_id: 1,
        host: "강남대학교",
        place: "강남대학교",
        intro: "  강남대학교 목양축전
                  ❗️Event❗️
                  내가 좋아하는 가수와 사진찍고 사인받고
                  싶다면 필독🙄
                  상품
                  중앙무대 연예인 공연 전 가수와 단독 사진 및
                  즉석 사인 (펜이랑 종이는 들고오세용👍🏻)
                  참여방법
                  1. 사진 찍고싶은 가수 이름 ex)사이먼 디
                  2. 친구 5명 이상 태그
                  3. 게시글 좋아요,공유 
                  4. 축제때 이 콘텐츠만큼은 꼭 이 친구랑 참여하고 싶다!! 이유 서술!
                  추첨 팀
                  가수당 오로지 1명!
                  많은 아름다움을 보여드리기 위해 더욱 더
                  노력하겠습니다🙇🏻",
        image: "poster/poster-3.jpg",
        start_date: "2017/05/23",
        end_date: "2017/05/25",
        category: 3
      )
      
      
      t.integer :user_id
     
      t.string :host  #주최하는곳 
      t.string :place #개최 장소 
      
      t.text :intro   #상세소개
      t.string :image #이미지 
      
      t.datetime :start_date #시작일자
      t.datetime :end_date #끝일자 
      
      t.integer :like #좋아요 
      t.integer :category #분류
      t.timestamps null: false
      #grade
      # 멋쟁이 사자처럼 0 
      # 동아리 1
      # 학과 행사 2
      # 교내 행사 3
      # 장학금 4
      # 외부 행사 5
      # 기타 6
      #회원가입 시 email로 받는다. 
=end

User.create(
        email: "example@gmail.com",
        password: "12345678"
    )


Poster.create(
        user_id: 1,
        host: "멋쟁이 사자처럼",
        place: "광교 문화 센터 허브 홀",
        intro: "안녕하세요. 멋쟁이사자처럼 경기 하프톤 입니다.",
        image: "poster/poster-1.png",
        start_date: "2017/05/27",
        end_date: "2017/05/27",
        category: 0
      )
      
Poster.create(
        user_id: 1,
        host: "한국 IT 경영학회",
        place: "Naver D.camp",
        intro: "안녕하세요. 안녕하세요.한국대학생 IT경영학회에서 강연회를 진행합니다.",
        image: "poster/poster-2.png",
        start_date: "2017/05/20",
        end_date: "2017/05/20",
        category: 5
      )

Poster.create(
        user_id: 1,
        host: "강남대학교",
        place: "강남대학교",
        intro: "  강남대학교 목양축전
                  ❗️Event❗️
                  내가 좋아하는 가수와 사진찍고 사인받고
                  싶다면 필독🙄
                  상품
                  중앙무대 연예인 공연 전 가수와 단독 사진 및
                  즉석 사인 (펜이랑 종이는 들고오세용👍🏻)
                  참여방법
                  1. 사진 찍고싶은 가수 이름 ex)사이먼 디
                  2. 친구 5명 이상 태그
                  3. 게시글 좋아요,공유 
                  4. 축제때 이 콘텐츠만큼은 꼭 이 친구랑 참여하고 싶다!! 이유 서술!
                  추첨 팀
                  가수당 오로지 1명!
                  많은 아름다움을 보여드리기 위해 더욱 더
                  노력하겠습니다🙇🏻",
        image: "poster/poster-3.jpg",
        start_date: "2017/05/23",
        end_date: "2017/05/25",
        category: 3
      )

