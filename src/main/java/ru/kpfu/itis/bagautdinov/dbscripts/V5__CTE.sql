
with updateAllNews as (
    update news set news = ' Hello '
    returning *
)
select * from updateAllNews;


with releaseNews as (
    select author_id,
    (case
        when date = 10
            then 'Released'
        else 'Not Released'
    end)info
from news)
select author_id, info
from releaseNews;

with subscribersFirstAuthor as (
    select client_id,
           (case
                when journalist_id = 1
                    then 'Read'
                else 'Not read'
               end)info
    from client_journalist)
select client_id, info
from subscribersFirstAuthor;