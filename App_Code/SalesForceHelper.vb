Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports Microsoft.VisualBasic
Imports System.Web

Public Class SalesForceHelper

    Public Shared Function GetAndSetSalesForceID(ByVal request As HttpRequest, ByVal session As HttpSessionState) As String
        Dim CurrentSalesForceID As String = request.QueryString.Item("SFID")
        Dim SavedSalesForceID As String = Convert.ToString(session("SFID"))
        Dim SalesForceID As String

        If Not (IsNothing(CurrentSalesForceID) Or CurrentSalesForceID = "") Then
            SalesForceID = CurrentSalesForceID

        ElseIf Not (IsNothing(SavedSalesForceID) Or SavedSalesForceID = "") Then
            SalesForceID = SavedSalesForceID
        Else
            Return String.Empty
        End If

        'Update Session if changed
        If SalesForceID <> SavedSalesForceID Then
            session("SFID") = SalesForceID
        End If

        Return SalesForceID
    End Function

    Public Shared Function SetSalesForceID(ByVal session As HttpSessionState, ByVal SalesForceID As String) As Boolean
        session("SFID") = SalesForceID
        Return True
    End Function

    Public Shared Function GetSalesForceID(ByVal session As HttpSessionState) As String
        Dim SalesForceID As String = Convert.ToString(session("SFID"))
        If Not (IsNothing(SalesForceID) Or SalesForceID = "") Then
            Return SalesForceID
        Else
            Return String.Empty
        End If
    End Function

    Public Shared Function ClearSalesForceID(ByVal session As HttpSessionState) As Boolean
        session("SFID") = Nothing
        Return True
    End Function

    Public Shared Function HasSalesForceID(ByVal session As HttpSessionState) As Boolean
        Dim SalesForceID As String = Convert.ToString(session("SFID"))
        If Not (IsNothing(SalesForceID) Or SalesForceID = "") Then
            Return True
        Else
            Return False
        End If
    End Function

End Class
