
require 'nokogiri' # data를 긁어오는 라이브러리 
require 'rest_client' # 복잡하지만 get post put 방식 가능. 
require 'open-uri' #편리하나 get방식의 요청만 가능. 

class CommonController < ApplicationController
  def index
      @poster_index = Poster.take(3)
      puts @poster_index.length
  end
  
  def soomin_test
      uri = "http://m.ticket.interpark.com/home/app_main_ticketopen.html"
      
      # open 메소드 안에 uri 를 넣어서 주소를 넣어준다. 
      @result = Nokogiri::HTML(open(uri))
  
      #result.css('div.contents ul').each do |r|
      #
      	#puts "제목"+r.css('dt').text
      	#puts "오픈일"+r.css('dd').text
      	#puts
      #	puts "제목:#{r.css('dt').text}"
    #  	puts "오픈일:#{r.css('dd').text}"
    #  	puts "URL: #{r['href']}"
    #  end
     
      @poster_index = Poster.take(3)
  end
   
end

