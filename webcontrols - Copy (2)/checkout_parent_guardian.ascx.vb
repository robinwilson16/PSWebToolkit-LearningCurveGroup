
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports Microsoft.VisualBasic.ApplicationServices
Imports System.Data
Imports PdfSharp.Pdf.Content.Objects
Imports CommandType = System.Data.CommandType
Imports System.Data.SqlClient


Partial Class webcontrols_checkout_parent_guardian
    Inherits CheckoutBaseControl


    Protected Overrides Sub OnLoad(e As EventArgs)
        '  Response.Write(WorkingData.EnrolmentRequestRow.EuroResidentID)



        If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 < 19 Then
            parent1panel.Visible = True
        Else
            parent1panel.Visible = False
            fldParentFirstName.IsRequired = False
            fldParentSurname.IsRequired = False
        End If



        MyBase.OnLoad(e)
        ''show course name 
    End Sub


    Private ReadOnly Property AFD_SERVER As String
        Get
            Return SystemSettings.AFDEvolution_Server
        End Get
    End Property

    Private ReadOnly Property AFD_SERIAL_NUMBER As String
        Get
            Return SystemSettings.AFDEvolution_SerialNumber
        End Get
    End Property

    Private ReadOnly Property AFD_PASSWORD As String
        Get
            Return SystemSettings.AFDEvolution_Password
        End Get
    End Property

    Private ReadOnly Property AFD_USER_ID As String
        Get
            Return SystemSettings.AFDEvolution_UserID
        End Get
    End Property

    Private Enum SearchType
        FastFind
        Search
        Retrieve
    End Enum


    Public Overrides Sub ValidateControl()

        If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 < 19 Then
            If WorkingData.EnrolmentRequestRow.ParentPhoneNumber = "" And WorkingData.EnrolmentRequestRow.ParentMobileTel = "" Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Please enter at least one Parent / Guardian Telephone number."
                v.IsValid = False
                Me.Page.Validators.Add(v)
            End If
        End If
        If WorkingData.EnrolmentRequestRow.Parent2PhoneNumber = "" And WorkingData.EnrolmentRequestRow.Parent2MobileTel = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please enter at least one Emergency Telephone number."
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        MyBase.ValidateControl()
    End Sub


    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        If Me.Page.IsValid Then

            '            Dim blnApplicationsOnly As Boolean = WorkingData.ShoppingCart IsNot Nothing AndAlso Not WorkingData.ShoppingCart.ContainsItemsOfType("Enrolment")
        End If

    End Sub
End Class
