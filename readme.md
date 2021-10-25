# Assignment 1: Data Analysis
## 1. Acquire the top 200,000 posts
Find the following results via the SQL COUNT function：
| viewCount(>) | viewCount(<=) | Count |
| ---- | ------ | ----- |
|127402|   _    | 49999 |
|74595 | 127402 | 50000 |
|53210 | 74595  | 50000 |
|41324 | 53210  | 49995 |

And, Thers are 8 records at viewCount = 41324.

Acquire the top 200,000 posts by SQL in `acquire_data.sql`. 
Save data as these files: `1-6.csv`, `2-49995`, `3-50000`, `4-50000`, `5-49999`.
``` SQL
select Id, PostTypeId, AcceptedAnswerId, ParentId,
CreationDate, DeletionDate,Score, ViewCount,
/* replace "," "\n" "\r", otherwise it can not be imported */
replace(replace(replace(Body, CHAR(10), ' '), CHAR(13), ' '), ',', ' ') as Body,
OwnerUserId, OwnerDisplayName,LastEditorUserId, LastEditorDisplayName,
LastEditDate, LastActivityDate,Title, Tags, AnswerCount, CommentCount, FavoriteCount,
ClosedDate, CommunityOwnedDate, ContentLicense
from posts
where posts.ViewCount>127402
order by posts.ViewCount
```

## 2. Load data into Hive

After creating table, load data (200000) into hive (`load_data_into_hive.sql`)
``` SQL
load data local inpath 'XXXXX.csv' into table posts;
```
Query the count of records
```shell
0: jdbc:hive2://localhost:10000> select count(*) from posts;
+---------+
|   _c0   |
+---------+
| 200000  |
+---------+
1 row selected (6.45 seconds)
```

## 3. Query Data
Hive is used for this task, because I don't need to write a lot of code, only need to write SQL.

3.1 The top 10 posts by score
```shell
0: jdbc:hive2://localhost:10000> select id, title, score from posts order by score desc limit 10;
+-----------+----------------------------------------------------+--------+
|    id     |                       title                        | score  |
+-----------+----------------------------------------------------+--------+
| 30494050  | How do I pass environment variables to Docker containers? | 999    |
| 4912092   | Using HTML5/Canvas/JavaScript to take in-browser screenshots | 999    |
| 11448068  | MySQL error code: 1175 during UPDATE in MySQL Workbench | 998    |
| 3702675   | How to catch and print the full exception traceback without halting/exiting the program? | 998    |
| 35411423  | How to dispatch a Redux action with a timeout?     | 997    |
| 20363719  | Java 8 List<V> into Map<K, V>                      | 997    |
| 4716503   | Reading a plain text file in Java                  | 997    |
| 12897374  | Get unique values from a list in python            | 997    |
| 582185    | How can I disable landscape mode in Android?       | 997    |
| 13064613  | How to prune local tracking branches that do not exist on remote anymore | 996    |
+-----------+----------------------------------------------------+--------+
10 rows selected (7.326 seconds)
```

3.2 The top 10 users by post score

```shell
0: jdbc:hive2://localhost:10000> select owneruserid, ownerdisplayname, score from posts order by score desc limit 10;
+--------------+-------------------+--------+
| owneruserid  | ownerdisplayname  | score  |
+--------------+-------------------+--------+
| 824377       |                   | 999    |
| 105565       |                   | 999    |
| 1476749      |                   | 998    |
| 266564       |                   | 998    |
| 911930       |                   | 997    |
| 1665365      |                   | 997    |
| 130888       |                   | 997    |
| 128112       |                   | 997    |
| 46297        | lostInTransit     | 997    |
| 288568       |                   | 996    |
+--------------+-------------------+--------+
10 rows selected (7.349 seconds)
```

3.3 The number of distinct users, who used the word “cloud” in one of their 
posts 

```shell
0: jdbc:hive2://localhost:10000> select count(distinct owneruserid) from posts where instr(body, "cloud")>0;
+------+
| _c0  |
+------+
| 616  |
+------+
1 row selected (7.348 seconds)
```

## 4. Calculate TF-IDF
Hive is used for this task, because you don't need to write a lot of code, you only need to write SQL.

The SQL of this task is `calculate_tfidf.sql`. Here are some results.
All the results are in `task4_result.txt`
|uid|docid|word|tfidf|
|---|-----|----|-----|
|105565|4912092|feedback|0.230443307312851|
|105565|4912092|screenshot|0.1582046055395491|
|105565|4912092|google|0.11908525145422795|
|105565|4912092|com/questions/6608327/google-style-send-feedback|0.07591602121605208|
|105565|4912092|com/tools/feedback/intl/en/learnmore|0.07591602121605208|
|105565|4912092|bug&quot|0.07591602121605208|
|105565|4912092|com/cdhei|0.07591602121605208|
|105565|4912092|com/feedback/api|0.07591602121605208|
|105565|4912092|tool&quot|0.07228915393352509|
|105565|4912092|nofollow|0.06878670065295439|
