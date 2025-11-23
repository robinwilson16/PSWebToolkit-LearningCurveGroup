Option Explicit On
Option Strict On

Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class courseenrol
    Inherits webenrolmentcontrolvalidate

    Public CourseInformationID As Integer

    Public ReadOnly Property OfferingID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("OfferingID"))
            End If
        End Get
    End Property

    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)

        CourseInformationID = CourseInformationHelper.GetCourseInformationID(Me.Session)

        'Get SalesForce ID from query string or session
        Dim SalesForceID As String = SalesForceHelper.GetAndSetSalesForceID(Me.Request, Me.Session)

    End Sub

    Protected Sub btnBack_Click(sender As Object, e As EventArgs) Handles btnBack.Click
        Response.Redirect("webenrolment.aspx?page=~/webcontrols/coursedisplay.ascx&CourseInformationID=" & CourseInformationID)
    End Sub

End Class
