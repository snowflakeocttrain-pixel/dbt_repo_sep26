{% macro unique_records(target_table_name,uniq_key,sort_key,src_table)%}

create table if not exists  CURATED_DATA.{{target_table_name}} as 
select * from RAW_DATA.{{src_table}} where 1=2;

{% if sort_key=='NA' %}

insert into CURATED_DATA.{{target_table_name}}
 select * from RAW_DATA.{{src_table}} 
   QUALIFY row_number() over(partition by {{uniq_key}} order by {{uniq_key}})=1

{% else %}

insert into CURATED_DATA.{{target_table_name}}
 select * from RAW_DATA.{{src_table}} 
   QUALIFY row_number() over(partition by {{uniq_key}} order by {{sort_key}} desc)=1

{% endif %}   

{% endmacro %}