Imports Microsoft.VisualBasic

Public Class AcademicYearHelper
    Public Shared Function GetCurrentAcademicYear() As String
        Dim currentDate As Date = Date.Now
        Dim year As Integer = currentDate.Year
        Dim month As Integer = currentDate.Month
        ' If month is August (8) or later, academic year is current year / next year
        If month >= 8 Then
            Return year.ToString().Substring(2) & "/" & (year + 1).ToString().Substring(2)
        Else
            Return (year - 1).ToString().Substring(2) & "/" & year.ToString().Substring(2)
        End If
    End Function

    Public Shared Function GetNextAcademicYear() As String
        Dim currentDate As Date = Date.Now
        Dim year As Integer = currentDate.Year
        Dim month As Integer = currentDate.Month
        ' If month is August (8) or later, next academic year is next year / year after next
        If month >= 8 Then
            Return (year + 1).ToString().Substring(2) & "/" & (year + 2).ToString().Substring(2)
        Else
            Return year.ToString().Substring(2) & "/" & (year + 1).ToString().Substring(2)
        End If
    End Function
End Class
