class HomeController < ApplicationController
  

  def index
  ## 임시로 
    $rt_num = params[:rt_num]
      if params[:rt_num]
        url ="http://apis.data.go.kr/B552015/NpsBplcInfoInqireService/getBassInfoSearch?ldong_addr_mgpl_dg_cd=41&ldong_addr_mgpl_sggu_cd=117&ldong_addr_mgpl_sggu_emd_cd=101&wkpl_nm=&bzowr_rgst_no=#{$rt_num}&pageNo=10&startPage=10&numOfRows=1&pageSize=1&serviceKey=IoGcqdatXH1xSmopMvIleCtd7ZJELW2kJg9d2WvfZdbxvH1stcbh8Gvdui/iNUG28Wcq/uppkV0YZqU4Bd3BOA==&&_type=json"
        isBrand= JSON.load(open(url))
        puts isBrand

        if isBrand["response"]["body"]["totalCount"] == 0  #없음=nil 탈퇴=2
          @result = "확인할 수 없습니다. 챗봇으로 문의주세요!"
        elsif isBrand["response"]["body"]["items"]["item"]["wkplJnngStcd"] == 1 #예시 124815
           @name= isBrand["response"]["body"]["items"]["item"]["wkplNm"]
           @result = @name+ ": 운영중"
        else
           @result = "탈퇴자입니다. 챗봇으로 문의주세요!"    
        end
      
        if isBrand["response"]["body"]["totalCount"] == 0
        redirect_to new_owner_session_path
        elsif isBrand["response"]["body"]["items"]["item"]["wkplJnngStcd"] == 1
        redirect_to new_owner_registration_path
        end 
      end  
    #@articles_num= params[:num]
    # $notice=Board.last(3).pluck(:content)
    @weeksago = Date.today.weeks_ago(1) #일주일간
    @now =Date.today
    @todays = Board.where(created_at: @weeksago.midnight .. @now.end_of_day).count
    @today_contents = Board.where(created_at:  @weeksago.midnight .. @now.end_of_day).pluck(:content)
  end

  def myrt
    @owner = current_owner
  end

end
