Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon

Partial Class checkout_dataprotection
    Inherits CheckoutBaseControl


    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        Dim p As New PaymentSubmitter

        If p.ShouldTransferToPaymentSite AndAlso (SystemSettings.UsePayPal Or SystemSettings.UseXPay) AndAlso WorkingData.ShoppingCart.GetTotalCost > 0 Then
            btnContinue.ImageResource = "PayPalButton"
        End If

        'Dim rowAttachment = WorkingData.EnrolmentRequestAttachment
        'WorkingData.EnrolmentRequestAttachments.TypeOfEvidence
        ''_lastAttachmentID -= 1
        'With rowAttachment

        '    ' Response.Write(WorkingData.EnrolmentRequestAttachments.) ' = ddlTypeOfEvidence.SelectedValue

        'End With


    End Sub

    Public Overrides Sub ValidateControl()

        If Not chkConfirm.Checked Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please confirm that you have read the declaration above."
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Me.ValidationSummary1.ShowSummary = True
        End If


        If Not StudentSignature.Signature IsNot Nothing Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please sign the form."
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Me.ValidationSummary1.ShowSummary = True
        End If
    End Sub

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        ValidateControl()
        WorkingData.EnrolmentRequestRow.StudentSignature = StudentSignature.Signature
        WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = "" 'empty age 
        WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = "" 'empty start date
        If WorkingData.EnrolmentRequestRow.CanBeContactBySMS = True Or WorkingData.EnrolmentRequestRow.GDPRAllowContactByEmail Or WorkingData.EnrolmentRequestRow.GDPRAllowContactByPhone = True Or WorkingData.EnrolmentRequestRow.GDPRAllowContactByPost Then
            WorkingData.EnrolmentRequestRow.AcceptMarketingConsent = True
        End If
        If Me.Page.IsValid Then
            Server.Transfer(GetResourceValue("checkout_makepayment_aspx"))
        End If

    End Sub

End Class
