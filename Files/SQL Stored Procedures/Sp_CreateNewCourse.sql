USE [CourseMates]
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateNewCourse]    Script Date: 05/13/2013 16:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_CreateNewCourse]
@SessionID varchar(50),
@userID int,
@CourseName varchar(45),
@IconClass varchar(50)

--Phase 1 : Checking the session valilidity( if exists, Check the 3 hours difference)
as 
begin
declare @SessionCheckExpr datetime 
set @SessionCheckExpr = NULL;
set @SessionCheckExpr = (select ExperationDate from CourseMates.dbo.tblSessions where @SessionID =[SessionID] and @userID =[userID])
if ((@SessionCheckExpr is not null) and ((datediff(mi,@SessionCheckExpr,getdate())<180)))
begin
	--Phase 2 :
	declare @resultCourseID int 
	insert INTO CourseMates.dbo.tblCourse VALUES (@CourseName,@IconClass)
	set @resultCourseID = @@identity
	--phase 3:
	insert INTO CourseMates.dbo.tblparticipants VALUES (@resultCourseID,@UserID,1)
	select @resultCourseID as Result
end
else
	select NULL as Result;
	
end