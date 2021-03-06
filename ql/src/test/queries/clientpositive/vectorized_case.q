set hive.explain.user=false;
set hive.fetch.task.conversion=none;
set hive.vectorized.execution.enabled = true
;
explain vectorization expression
select 
  csmallint,
  case 
    when csmallint = 418 then "a"
    when csmallint = 12205 then "b"
    else "c"
  end,
  case csmallint
    when 418 then "a"
    when 12205 then "b"
    else "c"
  end
from alltypesorc
where csmallint = 418
or csmallint = 12205
or csmallint = 10583
;
select 
  csmallint,
  case 
    when csmallint = 418 then "a"
    when csmallint = 12205 then "b"
    else "c"
  end,
  case csmallint
    when 418 then "a"
    when 12205 then "b"
    else "c"
  end
from alltypesorc
where csmallint = 418
or csmallint = 12205
or csmallint = 10583
;
explain vectorization expression
select 
  csmallint,
  case 
    when csmallint = 418 then "a"
    when csmallint = 12205 then "b"
    else null
  end,
  case csmallint
    when 418 then "a"
    when 12205 then null
    else "c"
  end
from alltypesorc
where csmallint = 418
or csmallint = 12205
or csmallint = 10583
;
