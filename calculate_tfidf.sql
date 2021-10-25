-- Total number of documents
set hivevar:n_docs=200000; 

create temporary macro getmax(x INT, y INT) if(x > y, x, y);
create temporary macro tfidf(tf FLOAT, df_t INT, n_docs INT) tf * (log(10, CAST(n_docs as FLOAT)/getmax(1,df_t)) + 1.0);

-- create relative views
create or replace view words
as
select
  id, word
from
  posts LATERAL VIEW explode(tokenize(body, true)) t as word
where
  body is not null and not is_stopword(word);

create or replace view term_frequency 
as
select id, word, freq
from (
    select id, tf(word) as word2freq
    from words
    group by id
) t 
LATERAL VIEW explode(word2freq) t2 as word, freq;

create or replace view doc_frequency
as
select word, count(distinct id) docs
from words
group by word;

create or replace view tfidf
as
select tf.id, tf.word,
  tfidf(tf.freq, df.docs, ${n_docs}) as tf_idf
from term_frequency tf 
  JOIN doc_frequency df ON (tf.word = df.word)
order by tf_idf desc;

create or replace view tfidf_user
as
select t.id, t.word, p.owneruserid as uid, t.tf_idf
from tfidf t
  left join posts p on (t.id = p.id);

-- get the result
select t.uid, t.id, t.word, t.tf_idf from (
  select *, row_number() over (partition by uid order by tf_idf desc) as rn
    from tfidf_user t
    right join (
      select owneruserid, score from posts order by score desc limit 10
    ) p on (t.uid = p.owneruserid) 
) t where rn<=10;

