-- create table
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

-- Load Data
load data local inpath '/root/data/1-6.csv' into table posts;
load data local inpath '/root/data/2-49995.csv' into table posts;
load data local inpath '/root/data/3-50000.csv' into table posts;
load data local inpath '/root/data/4-50000.csv' into table posts;
load data local inpath '/root/data/5-49999.csv' into table posts;