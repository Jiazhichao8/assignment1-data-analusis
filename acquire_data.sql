select Id, PostTypeId, AcceptedAnswerId, ParentId,
CreationDate, DeletionDate,Score, ViewCount,
/* replace "," "\n" "\r", otherwise it can not be imported */
replace(replace(replace(Body, CHAR(10), ' '), CHAR(13), ' '), ',', ' ') as Body,
OwnerUserId, OwnerDisplayName,LastEditorUserId, LastEditorDisplayName,
LastEditDate, LastActivityDate,Title, Tags, AnswerCount, CommentCount, FavoriteCount,
ClosedDate, CommunityOwnedDate, ContentLicense
from posts
where posts.ViewCount > 127402
order by posts.ViewCount

select Id, PostTypeId, AcceptedAnswerId, ParentId,
CreationDate, DeletionDate,Score, ViewCount,
/* replace "," "\n" "\r", otherwise it can not be imported */
replace(replace(replace(Body, CHAR(10), ' '), CHAR(13), ' '), ',', ' ') as Body,
OwnerUserId, OwnerDisplayName,LastEditorUserId, LastEditorDisplayName,
LastEditDate, LastActivityDate,Title, Tags, AnswerCount, CommentCount, FavoriteCount,
ClosedDate, CommunityOwnedDate, ContentLicense
from posts
where posts.ViewCount <= 127402 and posts.ViewCount > 74595
order by posts.ViewCount

select Id, PostTypeId, AcceptedAnswerId, ParentId,
CreationDate, DeletionDate,Score, ViewCount,
/* replace "," "\n" "\r", otherwise it can not be imported */
replace(replace(replace(Body, CHAR(10), ' '), CHAR(13), ' '), ',', ' ') as Body,
OwnerUserId, OwnerDisplayName,LastEditorUserId, LastEditorDisplayName,
LastEditDate, LastActivityDate,Title, Tags, AnswerCount, CommentCount, FavoriteCount,
ClosedDate, CommunityOwnedDate, ContentLicense
from posts
where posts.ViewCount <= 74595 and posts.ViewCount > 53210
order by posts.ViewCount

select Id, PostTypeId, AcceptedAnswerId, ParentId,
CreationDate, DeletionDate,Score, ViewCount,
/* replace "," "\n" "\r", otherwise it can not be imported */
replace(replace(replace(Body, CHAR(10), ' '), CHAR(13), ' '), ',', ' ') as Body,
OwnerUserId, OwnerDisplayName,LastEditorUserId, LastEditorDisplayName,
LastEditDate, LastActivityDate,Title, Tags, AnswerCount, CommentCount, FavoriteCount,
ClosedDate, CommunityOwnedDate, ContentLicense
from posts
where posts.ViewCount <= 53210 and posts.ViewCount > 41324
order by posts.ViewCount

select Id, PostTypeId, AcceptedAnswerId, ParentId,
CreationDate, DeletionDate,Score, ViewCount,
/* replace "," "\n" "\r", otherwise it can not be imported */
replace(replace(replace(Body, CHAR(10), ' '), CHAR(13), ' '), ',', ' ') as Body,
OwnerUserId, OwnerDisplayName,LastEditorUserId, LastEditorDisplayName,
LastEditDate, LastActivityDate,Title, Tags, AnswerCount, CommentCount, FavoriteCount,
ClosedDate, CommunityOwnedDate, ContentLicense
from posts
where posts.ViewCount = 41324
order by posts.ViewCount