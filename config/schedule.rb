# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# log 폴더에 실행 로그 저장
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}


# 변경시 콘솔에 whenever --update-crontab 
# 실행 로그 확인 원할 경우 crontab -l
# 로그 확인 원할 시 grep CRON /var/log/syslog


#Automate with Capistrano 디플로이 전 필요

every 1.day, at: '12:00am' do
    runner "Zizuminfo.Subway"
    runner "Zizuminfo.Momstouch"
    runner "Menu.Subway"
    runner "Menu.Momstouch"
end
