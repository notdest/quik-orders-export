table   = 'trades'



f = io.open(getScriptPath() .. os.date("\\%Y-%m-%d.csv"), "w")
f:write("date,time,price,qty\n")

for i = 0,getNumberOf(table) - 1 do
    item    = getItem(table,i)
    dt      = item.datetime
    str     = string.format("%d-%02d-%02d,",dt.year, dt.month, dt.day)
    str     = str..string.format("%d:%d:%d,",dt.hour, dt.min, dt.sec)
    if bit.band( item.flags, 4) ~= 0 then
        str     = str..string.format("%d,%d",item.price,(-item.qty))        -- this is a sale
    else    
        str     = str..string.format("%d,%d",item.price,item.qty)           -- this is a buy 
    end
    --message(str)
    f:write(str.."\n")
end


f:flush()   
f:close()

message('   done   ')