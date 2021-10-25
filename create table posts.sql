create table posts
(
    Id INT,
    PostTypeId INT,
    AcceptedAnswerId INT,
    ParentId STRING,
    CreationDate STRING,
    DeletionDate STRING,
    Score INT,
    ViewCount INT,
    Body STRING,
    OwnerUserId INT,
    OwnerDisplayName STRING,
    LastEditorUserId INT,
    LastEditorDisplayName STRING,
    LastEditDate STRING,
    LastActivityDate STRING,
    Title STRING,
    Tags STRING,
    AnswerCount INT,
    CommentCount INT,
    FavoriteCount INT,
    ClosedDate STRING,
    CommunityOwnedDate STRING,
    ContentLicense STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\"",
   "escapeChar"    = "\\"
)
STORED AS TEXTFILE;

ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','

load data local inpath '/root/data/1-6.csv' into table posts;

Id, PostTypeId, AcceptedAnswerId, ParentId, CreationDate, DeletionDate,
Score, ViewCount, Body, OwnerUserId, OwnerDisplayName,
LastEditorUserId, LastEditorDisplayName, LastEditDate, LastActivityDate,
Title, Tags, AnswerCount, CommentCount, FavoriteCount,
ClosedDate, CommunityOwnedDate, ContentLicense


select top 1 Id, PostTypeId, AcceptedAnswerId, ParentId, CreationDate, DeletionDate,
Score, ViewCount, replace(Body, '\n', '') as body, OwnerUserId, OwnerDisplayName,
LastEditorUserId, LastEditorDisplayName, LastEditDate, LastActivityDate,
Title, Tags, AnswerCount, CommentCount, FavoriteCount,
ClosedDate, CommunityOwnedDate, ContentLicense from posts;

select top 50 Id, PostTypeId, AcceptedAnswerId, ParentId, CreationDate, DeletionDate,
Score, ViewCount, replace(replace(Body, CHAR(10), ' '), ',', ' ') as Body, OwnerUserId, OwnerDisplayName,
LastEditorUserId, LastEditorDisplayName, LastEditDate, LastActivityDate,
Title, Tags, AnswerCount, CommentCount, FavoriteCount,
ClosedDate, CommunityOwnedDate, ContentLicense from posts;

select Id, PostTypeId, AcceptedAnswerId, ParentId,
CreationDate, DeletionDate,Score, ViewCount,
replace(replace(replace(Body, CHAR(10), ' '), CHAR(13), ' '), ',', ' ') as Body,
OwnerUserId, OwnerDisplayName,LastEditorUserId, LastEditorDisplayName,
LastEditDate, LastActivityDate,Title, Tags, AnswerCount, CommentCount, FavoriteCount,
ClosedDate, CommunityOwnedDate, ContentLicense
from posts
where posts.ViewCount>53210 and posts.ViewCount<=74595
ORDER BY posts.ViewCount