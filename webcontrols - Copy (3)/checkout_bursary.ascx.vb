Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon

Partial Class checkout_bursary
    Inherits CheckoutBaseControl

    Private Property _lastAttachmentID() As Integer
        Get
            Return CInt(HttpContext.Current.Session("LastAttachmentID"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("LastAttachmentID") = value
        End Set
    End Property

    Public ReadOnly Property OfferingID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("OfferingID"))
            End If
        End Get
    End Property


    Public ReadOnly Property Refno() As String
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("refno")) Then
                Return ""
            Else
                Return Me.Page.Request("refno")
            End If
        End Get
    End Property
    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        If Not IsPostBack Then

            LoadAreas()
            WorkingData.EnrolmentRequestRow.RefNo = Refno()
            If Refno() <> "" Then
                fldrefno.IsReadOnly = True
            Else
                fldrefno.IsReadOnly = False
            End If
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 <> "" Then ddlAsylum.SelectedValue = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 <> "" Then ddlLive.SelectedValue = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined4 <> "" Then ddlIncome.SelectedValue = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined5
            If WorkingData.EnrolmentRequestRow.ReferencesNotes <> "" Then notes.Text = WorkingData.EnrolmentRequestRow.ReferencesNotes

            'tick boxes Eligibility for bursary for defined vulnerable groups
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined22 = "True" Then chkInCare.Checked = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined22
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined23 = "True" Then chkCareLeaver.Checked = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined23
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined24 = "True" Then checkISorUC.Checked = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined24
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined25 = "True" Then chkDLAorPIP.Checked = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined25
            'tick boxes Eligibility for free meals in further education
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined26 = "True" Then chkIncomeSuport.Checked = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined26
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined27 = "True" Then chkIncomeJSA.Checked = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined27
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined28 = "True" Then chkIncomeESA.Checked = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined28
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined29 = "True" Then chkAsylum.Checked = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined29
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined30 = "True" Then chkStatePen.Checked = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined30
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined31 = "True" Then chkChildTax.Checked = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined31
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined32 = "True" Then chkWTC.Checked = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined32
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined33 = "True" Then chkUC.Checked = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined33
        End If

        'chkConfirm.Checked = True

        Session("RequestMode") = RequestMode.ApplicationRequest

        '  Response.Write("----" & WorkingData.EnrolmentRequestRow.StudentDetailUserDefined3)

        WorkingData.EnrolmentRequestRow.DateOfBirth = "01/01/1900"
        WorkingData.EnrolmentRequestRow.FirstForename = "Bursary"
        WorkingData.EnrolmentRequestRow.Surname = "Bursary"
        'WorkingData.EnrolmentRequestRow.Address1 = "Bursary"
        'WorkingData.EnrolmentRequestRow.PostcodeIn = "w2"
        'WorkingData.EnrolmentRequestRow.PostcodeOut = "22"
    End Sub


    Private Sub LoadAreas()


        ' Dim intOfferingID As Integer = 786483
        '  Dim intOfferingID As Integer = 203419


        If OfferingID() <> -1 Then

            Dim tblOffering As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering.WebSiteAvailabilityIDColumn, tblOffering.CourseInformationIDColumn, tblOffering.TotalFeeAmountColumn, tblOffering.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, OfferingID())
            tblOffering.TableAdapter.Load(tblOffering, v)


            If tblOffering.Count > 0 AndAlso tblOffering(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering(0)

                    'Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))
                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
                    End If
                    item.Description = .GetRowDescription
                    item.ItemType = "Application"
                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                End With
                With WorkingData.ShoppingCart
                    WorkingData.ClearWorkingData()
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With
            End If
        End If


        PopulateOfferingFeeTable()
        loadAttachments()

    End Sub

    Protected Sub PopulateOfferingFeeTable()
        'Load all offerings in the shopping basket
        Dim stb As New Text.StringBuilder
        For Each item As ShoppingCartItem In WorkingData.ShoppingCart.Items
            If stb.Length > 0 Then stb.Append(",")
            stb.Append(item.OfferingID)
        Next
        If stb.Length > 0 Then
            'Load offerings
            Dim tblOffering As New OfferingDataTable
            Dim vOffering As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblOffering)
            vOffering.Columns.AddPKColumns()
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn)
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

            tblOffering.TableAdapter.Load(tblOffering, vOffering)


        End If
    End Sub


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

    Private Sub CheckDetails()

        'add selected eligibility items to AUDF1

        'Dim StrSupport As String = String.Empty
        'If Not chkVulnerable.SelectedValue = "" Then
        '    For Each item As ListItem In chkVulnerable.Items
        '        If item.Selected Then
        '            StrSupport = " | " & StrSupport & item.Value & " | "
        '        End If
        '    Next
        'Else
        '    StrSupport = ""
        'End If

        'Dim StrSupport2 As String = String.Empty
        'If Not chkFreeMeals.SelectedValue = "" Then
        '    For Each item As ListItem In chkFreeMeals.Items
        '        If item.Selected Then
        '            StrSupport2 = " | " & StrSupport2 & item.Value & " | "
        '        End If
        '    Next
        'Else
        '    StrSupport2 = ""
        'End If

        ' WorkingData.EnrolmentRequestRow.StudentDetailUserDefined3 = StrSupport
        'WorkingData.EnrolmentRequestRow.StudentDetailUserDefined4 = StrSupport2
    End Sub

    Public Overrides Sub ValidateControl()

        If Not chkConfirm.Checked Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please confirm that you have read the declaration above."
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Me.ValidationSummary2.ShowSummary = True
        End If

        If ddlAsylum.SelectedValue = "" Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please tell us if you are you an Asylum Seeker?"
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Me.ValidationSummary2.ShowSummary = True
        End If

        If ddlLive.SelectedValue = "" Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please tell us if you Who you live with?"
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Me.ValidationSummary2.ShowSummary = True
        End If
        If ddlIncome.SelectedValue = "" Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please tell us Is the total gross annual income for your household below £28,000"
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Me.ValidationSummary2.ShowSummary = True
        End If
        If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined6 = "" And WorkingData.EnrolmentRequestRow.StudentDetailUserDefined7 = "" Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please state the gross annual income for at least 1 adult"
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Me.ValidationSummary2.ShowSummary = True
        End If
        'If trNoItems.Visible = True AndAlso Not ChkOverride.checked Then

        '    Dim a As New CustomValidator
        '    a.ErrorMessage = "Please upload some evidence, or tick 'I cant upload Evidence'"
        '    a.IsValid = False
        '    Me.Page.Validators.Add(a)
        '    Me.ValidationSummary1.ShowSummary = True


        'End If




    End Sub

    Public Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click


        Me.Page.Validate()

        If Me.Page.IsValid Then

            CheckDetails()

            Dim chkconfirm As Boolean = True

            WorkingData.ApplicationRequestRow.StudentDeclaration = chkconfirm
            If ddlAsylum.SelectedValue <> "" Then WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = ddlAsylum.SelectedValue
            If ddlLive.SelectedValue <> "" Then WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = ddlLive.SelectedValue
            If ddlIncome.SelectedValue <> "" Then WorkingData.EnrolmentRequestRow.StudentDetailUserDefined4 = ddlIncome.SelectedValue
            If notes.Text <> "" Then WorkingData.EnrolmentRequestRow.ReferencesNotes = notes.Text

            'tick boxes Eligibility for bursary for defined vulnerable groups
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined22 = chkInCare.Checked
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined23 = chkCareLeaver.Checked
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined24 = checkISorUC.Checked
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined25 = chkDLAorPIP.Checked
            'tick boxes Eligibility for free meals in further education
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined26 = chkIncomeSuport.Checked
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined27 = chkIncomeJSA.Checked
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined28 = chkIncomeESA.Checked
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined29 = chkAsylum.Checked
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined30 = chkStatePen.Checked
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined31 = chkChildTax.Checked
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined32 = chkWTC.Checked
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined33 = chkUC.Checked

            Response.Redirect(GetResourceValue("checkout_makepayment_aspx"))

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

End Class
