setlocal
@echo off
set DefaultContent=NONE
set SelectContent=%DefaultContent%

svn cleanup %cd% --username yuxikuo --password Yuxikuo3501

sqlite3 .svn/wc.db "delete from work_queue"

set /p InputContent=Select Content: 
set SelectContent=%InputContent%

sqlite3 .svn/wc.db "select * from nodes where checksum like '%SelectContent%'"
sqlite3 .svn/wc.db "delete from nodes where checksum like '%SelectContent%'"


pause