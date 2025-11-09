Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon

Partial Class webcontrols_checkout_employment
    Inherits CheckoutBaseControl

    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        If Not (IsPostBack) Then

            If WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentStatusID <> "" Then selectEmployed.SelectedValue = WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentStatusID
            If WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentIntensityID <> "" Then selectEmploymentIntensity.SelectedValue = WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentIntensityID
            If WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfEmploymentID <> "" Then selectEmploymentLength.SelectedValue = WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfEmploymentID
            If WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfUnemploymentID <> "" Then selectLengthUnemployed.SelectedValue = WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfUnemploymentID
            If WorkingData.EnrolmentRequestEmploymentHistoryRow.BenefitStatusIndicatorID <> "" Then selectBenefits.SelectedValue = WorkingData.EnrolmentRequestEmploymentHistoryRow.BenefitStatusIndicatorID
            If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined5 <> "" Then txtWhatOther.Value = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined5
            'If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined52 <> "" Then selectDropDownTakeHomePay.SelectedValue = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined52
            ' If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined53 <> "" Then selectDropDownUniversalCredit.SelectedValue = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined53
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined54 <> "" Then txtGrossSalary.Value = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined54

            ' If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined43 = "True" Then chkOtherStateBen.checked = True
            ' If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined43 = "False" Then chkOtherStateBen.Checked = False
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined55 = "True" Then chkNoStateBen.Checked = True
            'If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined55 = "False" Then chkNoStateBen.Checked = False
            '  ddlFee.SelectedValue = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined44
            If WorkingData.EnrolmentRequestEmploymentHistoryRow.IsSelfEmployed Then
                rdoSelfEmp.SelectedValue = 1
            Else
                rdoSelfEmp.SelectedValue = 0
            End If
            loadAttachments()
        End If
        If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 > 18 Then
            nino.IsRequired = True

        End If
        'If Not WorkingData.EnrolmentRequestRow.StudentDetailUserDefined44 Is Nothing Then
        'ddlFee.Items.Add(New ListItem("I am paying my fees through the Student Loans Company*", "H"))
        'End If

    End Sub

    Public Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        If Me.Page.IsValid Then

            'Response.Write("---" + selectEmployed.SelectedValue)
            'WorkingData.EnrolmentRequestEmploymentHistory.NewRow()
            WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentStatusID = selectEmployed.SelectedValue
            WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentIntensityID = selectEmploymentIntensity.SelectedValue
            WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfEmploymentID = selectEmploymentLength.SelectedValue
            WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfUnemploymentID = selectLengthUnemployed.SelectedValue
            WorkingData.EnrolmentRequestEmploymentHistoryRow.BenefitStatusIndicatorID = selectBenefits.SelectedValue
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined5 = txtWhatOther.Value
            'WorkingData.EnrolmentRequestRow.StudentDetailUserDefined52 = selectDropDownTakeHomePay.SelectedValue
            'WorkingData.EnrolmentRequestRow.StudentDetailUserDefined53 = selectDropDownUniversalCredit.SelectedValue
            'WorkingData.EnrolmentRequestRow.StudentDetailUserDefined54 = txtGrossSalary.Value


            ' WorkingData.EnrolmentRequestRow.StudentDetailUserDefined43 = chkOtherStateBen.Checked
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined55 = chkNoStateBen.Checked
            If rdoSelfEmp.SelectedValue.ToString.Length > 0 Then
                    WorkingData.EnrolmentRequestEmploymentHistoryRow.IsSelfEmployed = rdoSelfEmp.SelectedValue
                End If

            '  WorkingData.EnrolmentRequestRow.StudentDetailUserDefined44 = ddlFee.SelectedValue
            '   Response.Redirect(GetResourceValue("checkout_attachments_he_aspx"))
            '  Response.Redirect(GetResourceValue("checkout_attachments"))


        End If

    End Sub


    Public Overrides Sub ValidateControl()
        'Response.Write(selectBenefits.SelectedValue)
        If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 > 18 And WorkingData.EnrolmentRequestRow.NI = "" And WorkingData.EnrolmentRequestRow.StudentDetailUserDefined33 = "" And WorkingData.EnrolmentRequestRow.StudentDetailUserDefined35 = "" And WorkingData.EnrolmentRequestRow.StudentDetailUserDefined36 = "" And WorkingData.EnrolmentRequestRow.StudentDetailUserDefined37 = "" And WorkingData.EnrolmentRequestRow.StudentDetailUserDefined51 = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please provide your National Insurance Number"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If
        If selectEmployed.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please tell us your employment status"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If
        If selectBenefits.SelectedValue = "06" And txtWhatOther.value = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please complete What is the other state benefit?"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If
        If selectEmployed.SelectedValue = "11" Or selectEmployed.SelectedValue = "12" Then
            If selectLengthUnemployed.SelectedValue = "" Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Length of of time umemployed must be provided"
                v.IsValid = False
                Me.Page.Validators.Add(v)
            End If
            If (selectBenefits.SelectedValue = "" And (chkNoStateBen.Checked = False)) Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Please either select the benefits you are receiving or tick another state benefit / no benefits"
                v.IsValid = False
                Me.Page.Validators.Add(v)
            End If

        End If
        If selectEmployed.SelectedValue = "10" Then
            If selectEmploymentIntensity.SelectedValue = "" Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Hours per week must be provided"
                v.IsValid = False
                Me.Page.Validators.Add(v)
            End If
            If selectEmploymentLength.SelectedValue = "" Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Length of time in employment must be provided"
                v.IsValid = False
                Me.Page.Validators.Add(v)
            End If
            If Len(txtGrossSalary.Value) = 0 Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Annual Gross Salary must be provided"
                v.IsValid = False
                Me.Page.Validators.Add(v)
            End If

            ''Employed check for EII and LOE and SelfEmp
            If Not (rdoSelfEmp.SelectedValue = "1" Or rdoSelfEmp.SelectedValue = "0") Then

                Dim a As New CustomValidator
                a.IsValid = False
                a.ErrorMessage = "If you are Employed, are you self employed?"
                Me.Page.Validators.Add(a)
                ValidationSummary1.CssClass = "error"

            End If

            ''WorkingData.EnrolmentRequestRow.StudentDetailUserDefined52 = selectDropDownTakeHomePay.SelectedValue
            ''WorkingData.EnrolmentRequestRow.StudentDetailUserDefined53 = selectDropDownUniversalCredit.SelectedValue
            ''WorkingData.EnrolmentRequestRow.StudentDetailUserDefined54 = selectGrossSalary.Value



        End If
        MyBase.ValidateControl()
    End Sub



    Private Property _lastAttachmentID() As Integer
        Get
            Return CInt(HttpContext.Current.Session("LastAttachmentID"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("LastAttachmentID") = value
        End Set
    End Property

    Protected Sub rptAttachments_ItemCommand(source As Object, e As RepeaterCommandEventArgs)
        If (e.CommandName = "RemoveAttachment") Then
            Dim attachmentID = CCCDataTypeConverter.Convert(Of Integer)(e.CommandArgument)
            Dim rowToDelete = WorkingData.EnrolmentRequestAttachments.FindByAttachmentID(attachmentID)
            If (rowToDelete IsNot Nothing) Then
                WorkingData.EnrolmentRequestAttachments.RemoveRow(rowToDelete)
                loadAttachments()
            End If
        End If
    End Sub


    Private Sub loadAttachments()
        rptAttachments.DataSource = WorkingData.EnrolmentRequestAttachments
        rptAttachments.DataBind()
        If (WorkingData.EnrolmentRequestAttachments.Rows.Count = 0) Then
            trNoItems.Visible = True
        Else
            trNoItems.Visible = False
        End If
    End Sub

    Private Sub btnUpload_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpload.Click
        trNoItems.Visible = False
        Page.MaintainScrollPositionOnPostBack = True
        Me.Page.Validate()

        ''Following line is important to perform validations on File Upload control based on setup done on control.
        Me.fuAttachment.ValidateFile()

        If Not Me.Page.IsValid Then
            Return
        End If


        Dim rowAttachment = WorkingData.EnrolmentRequestAttachments.NewRow
        _lastAttachmentID -= 1
        With rowAttachment
            .AttachmentID = _lastAttachmentID
            .TypeOfEvidence = (ddlTypeOfEvidence.SelectedValue & System.DateTime.Now)
            '    .Notes = txtNotes.Text.Trim
            .Attachment = fuAttachment.FileBytes
            .FileName = fuAttachment.FileName
            .Size = fuAttachment.FileBytes.Length
            If CCCAttachmentThumbnailGenerator.FilenameIndicatesFileIsCompatibleImage(fuAttachment.FileName) Then
                Try
                    .ImageThumb = CCCAttachmentThumbnailGenerator.CreateThumbnailAsByteArray(.Attachment, 96)
                Catch ex As Exception
                    ' Cannot create thumb nail- ignore error
                    .ImageThumb = Nothing ' No thumb-nail
                End Try
            End If
            .CreatedDate = DateTime.Now
        End With
        WorkingData.EnrolmentRequestAttachments.AddRow(rowAttachment)
        ''Reload attachments to refresh the grid and clear the controls for user to do fresh entry again.
        loadAttachments()
        ' txtNotes.Text = Nothing
        ddlTypeOfEvidence.SelectedIndex = 0
    End Sub

End Class
