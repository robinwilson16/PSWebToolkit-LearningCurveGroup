Public Class CourseInformationHelper
    Public Shared Function SetCourseInformationID(ByVal session As HttpSessionState, ByVal courseInformationID As String) As Boolean
        Dim courseInformationIDInt As Integer
        Int32.TryParse(courseInformationID, courseInformationIDInt)

        session("CourseInformationID") = courseInformationIDInt
        Return True
    End Function

    Public Shared Function GetCourseInformationID(ByVal session As HttpSessionState) As Integer
        Dim courseInformationID As Integer = CInt(session("CourseInformationID"))
        If Not (IsNothing(courseInformationID) Or courseInformationID <= 0) Then
            Return courseInformationID
        Else
            Return -1
        End If
    End Function
End Class