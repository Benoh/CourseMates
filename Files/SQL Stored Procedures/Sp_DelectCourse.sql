USE [CourseMates]
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteCourse]    Script Date: 05/13/2013 16:28:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_DeleteCourse]
@CourseID int,
@UserID int,
@SessionID varchar(100)
as
begin
	declare @SessionCheckExpr datetime 
	set @SessionCheckExpr = NULL;
	set @SessionCheckExpr = (select ExperationDate from CourseMates.dbo.tblSessions where @SessionID =[SessionID] and @userID =[userID])
	if ((@SessionCheckExpr is not null) and ((datediff(mi,@SessionCheckExpr,getdate())<180)))
	begin
			--get the courseid from courses.
			declare @courseIDCheck int =-1
			set @courseIDCheck =(SELECT [courseId] from CourseMates.dbo.tblParticipants where @UserID=[UserId] AND @CourseID=[CourseID] AND IsAdmin=1)
			if (@CourseIDCheck!=-1)
			begin
				delete FROM CourseMates.dbo.tblForum where CourseId =@CourseID
				delete from CourseMates.dbo.tblFile where CourseId = @CourseId
				delete from coursemates.dbo.tblParticipants where @CourseID=CourseID
				delete from CourseMates.dbo.tblForum where CourseId =@CourseID
				delete from CourseMates.dbo.tblCourse where @CourseID=tblCourse.Id
				select 1 as result
			end
			else select 0 as Result
	end
	else select 0 as result
END